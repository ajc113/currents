class Post < ActiveRecord::Base


	has_many :comments, dependent: :destroy
	belongs_to :admin_user

    mount_uploader :image, PostImageUploader
	
	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true

	extend FriendlyId
  	friendly_id :title, use: :slugged

  	def word_count
     self.body.split.size
	end

	def reading_time
     (word_count / 180.0).ceil
	end
	
end
