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


  #display_name is defined for activeadmin
	def display_name
		self.email
	end

	after_create :send_notification

	def send_notification
		AdminMailer.new_user(self).deliver
	end
	

end
