class AddAttachmentImageToHotspots < ActiveRecord::Migration
  def self.up
    change_table :hotspots do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :hotspots, :image
  end
end
