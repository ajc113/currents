class Post < ActiveRecord::Base
	acts_as_taggable_on :tags


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
	
	def self.search(search)
  if search
    self.where("name like ?", "%#{search}%")
  else
   self.all
  end
end  

end
