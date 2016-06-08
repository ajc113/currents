class Buzz < ActiveRecord::Base
	belongs_to :user
	validates :post, length: { maximum: 180 }

end
