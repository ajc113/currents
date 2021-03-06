class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :state_waters, presence: true
  has_many :reports
  has_many :buzzs   
  has_many :locations, through: :reports
  belongs_to :state, primary_key: :name, foreign_key: :state_waters, optional: true
  after_create :create_stripe_customer
  after_create :send_notification if Rails.env.production?
  # after_create :send_welcome_email
  after_create :add_user_to_list unless Rails.env.test? || Rails.env.development?
  before_destroy :delete_stripe_customer

  def self.accumulated_user_count
    @data = User.group_by_week(:created_at).count
    accumulator = 0
    @data.transform_values! do |val|
        val += accumulator
        accumulator = val
    end
    @data
  end

  def full_name
    (first_name if first_name) + ' ' + (last_name if last_name)
  end


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
    AdminMailer.new_user(self).deliver
  end

  def send_welcome_email
    DeviseCustomMailer.welcome_mailer(self).deliver
  end

  def add_user_to_list
    gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'], debug: true)
    begin
      gibbon.lists(ENV["MAILCHIMP_LIST_ID_NEWSLETTER"]).members.create(body: { 
        email_address: self.email,
        status: "subscribed",
        merge_fields: {:FNAME => self.first_name, :LNAME => self.last_name}
      })
    rescue Gibbon::MailChimpError => error
      GithubIssues.create(error, self.class.name, __method__, self.inspect)
    end
  end

  def create_stripe_customer
    unless Rails.env.test?
      StripeCustomer.create(self)
      #if Rails.env.development?
        #StripeSubscription.create(self, DateTime.now.to_i + 300 )
      #else
        #StripeSubscription.create(self, (Date.today + 31).to_time.to_i )
      #end
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


end
