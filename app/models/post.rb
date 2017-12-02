class Post < ActiveRecord::Base


	has_many :comments, dependent: :destroy
	belongs_to :admin_user

    mount_uploader :image, PostImageUploader
	
	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true

	extend FriendlyId
  	friendly_id :title, use: :slugged

end
