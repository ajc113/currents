class Intel < ApplicationRecord
	acts_as_taggable_on :tags
	paginates_per 10


	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true

	extend FriendlyId
	friendly_id :title, use: :slugged


	# def spotter
	# Intel.tagged_with(["spotter"], :match_all => true)
	# end


	def self.search(search)
	if search
	  self.where("title LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%")
	else
	  self.all
	end
	end


end
