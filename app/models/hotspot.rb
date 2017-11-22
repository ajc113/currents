class Hotspot < ActiveRecord::Base

	has_attached_file :image, styles: { large: "600X600>", medium: "300x300>", thumb: "100x100>" } 
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  	validates :name, presence: true
end
