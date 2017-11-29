class Hotspot < ActiveRecord::Base

        mount_uploader :image, HotspotImageUploader

  	validates :name, presence: true
end
