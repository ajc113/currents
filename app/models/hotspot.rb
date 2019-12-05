class Hotspot < ApplicationRecord

    mount_uploader :image, HotspotImageUploader

  	validates :name, presence: true
end
