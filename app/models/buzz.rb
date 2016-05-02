class Buzz < ActiveRecord::Base
	belongs_to :user
	validates :post, length: { maximum: 50 }

end
