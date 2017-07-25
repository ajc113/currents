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
  after_create :create_stripe_customer
  before_destroy :delete_stripe_customer

  #display_name is defined for activeadmin
	def display_name
		self.email
	end

  def create_stripe_customer
    StripeCustomer.create(self)
    if Rails.env.development?
      StripeSubscription.create(self, DateTime.now.to_i + 300 )
    else
      StripeSubscription.create(self, (Date.today + 31).to_time.to_i )
    end
  end

  def delete_stripe_customer
    StripeCustomer.delete(self)
  end

  def trial_over?
    Date.today > self.created_at.to_date + 31 ? true : false
  end

  def remaining_trial_days
    ((self.created_at.to_date + 31.days) - Date.today).to_i
  end

  def has_active_subscription?
    self.subscription_id? && is_active?
  end
end
