class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :state_waters, presence: true
  has_many :reports
  has_many :buzzs
  has_many :locations, through: :reports
  belongs_to :state, primary_key: :name, foreign_key: :state_waters
  validate :create_stripe_customer, on: :create
  after_create :send_notification if Rails.env.production?
  before_destroy :delete_stripe_customer

  belongs_to :plan


  #display_name is defined for activeadmin
  def display_name
    self.email
  end

  def self.last_sign_in_before_week
    where('last_sign_in_at = ? and create_at > ? and payment_source = ?', Date.today - 7, Date.today - 31, nil)
  end

  def self.last_sign_in_before_week_in_trial
    where('last_sign_in_at = ? and created_at < ?', Date.today - 7, Date.today - 31)
  end

  def send_notification
    AdminMailer.delay.new_user(self)
  end

  def create_stripe_customer
    begin
      customer = Stripe::Customer.create(
        email: email,
        source: payment_source
      )
      self.stripe_customer_id = customer.id
    rescue Stripe::CardError => error
      errors[:payment_source] << error.message
    else
      create_stripe_subscription
    end
  end

  def create_stripe_subscription
    unless Rails.env.test?
      if Rails.env.development?
        subscription = Stripe::Subscription.create(
          :customer  => stripe_customer_id,
          :plan      => self.plan.stripe_id,
          :trial_end => DateTime.now.to_i + 300,
          :metadata  => { "automatic" => true }
        )
        self.subscription_id = subscription.id
        self.is_active = true
      else
        subscription = Stripe::Subscription.create(
          :customer  => stripe_customer_id,
          :plan      => plan.stripe_id,
          :trial_end => (Date.today + 3).to_time.to_i,
          :metadata  => { "automatic" => true }
        )
        self.subscription_id = subscription.id
        self.is_active = true
      end
    end
  end

  def delete_stripe_customer
    StripeCustomer.delete(self)
  end

  def trial_over?
    if self.subscription_id?
      begin
        StripeCustomer.retrieve(self).subscriptions.data[0].status == 'trialing' ? false : true
      rescue
        return true
      end
    else
      true
    end
  end

  def trial_running?
    !trial_over?
  end

  def remaining_trial_days
    trial_end_timestamp = StripeCustomer.retrieve(self).subscriptions.data.first.trial_end.to_s
    ((DateTime.strptime(trial_end_timestamp, '%s').to_date) - Date.today).to_i
  end

  def has_active_subscription?
    begin
      StripeCustomer.retrieve(self).subscriptions.total_count > 0
    rescue
      return false
    end
  end

  def does_not_have_active_subscription?
    !has_active_subscription?
  end

  def soft_delete
    update_attribute(:deleted_at, Time.current)
  end

  def active_for_authentication?
    super && !deleted_at
  end

  def inactive_message
    !deleted_at ? super : :deleted_account
  end

  def trialing?
    return true if calculate_trial_days
    return false
  end

  def calculate_trial_days
    result = 30 - (Date.today - self.created_at.to_date).to_i
    return result if result > 0
    return nil if result < 0
  end

  def active_plans_for_user
    Plan.active.where.not(id: plan.id)
  end
end
