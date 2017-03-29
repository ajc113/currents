class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

   has_many :reports
   has_many :buzzs   
   has_many :locations, through: :reports
   def display_name
     self.email
   end
end
