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
    StripeSubscription.create(self)
  end

  def delete_stripe_customer
    StripeCustomer.delete(self.stripe_customer_id)
  end

  def trial_over?
    Date.today > self.created_at.to_date + 31 ? true : false
  end
end
