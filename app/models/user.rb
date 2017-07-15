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
  after_create :generate_stripe_customer_id

  #display_name is defined for activeadmin
	def display_name
		self.email
	end

  def generate_stripe_customer_id
    StripeCustomer.new(self)
    StripeCustomer.subscribe(self)
  end
end
