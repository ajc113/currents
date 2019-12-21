class Buzz < ApplicationRecord
	belongs_to :user
	validates :post, length: { maximum: 180 }, presence: true

end
