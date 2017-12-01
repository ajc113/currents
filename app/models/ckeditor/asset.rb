class Ckeditor::Asset < ActiveRecord::Base
  include Ckeditor::Orm::ActiveRecord::AssetBase
  belongs_to: :posts
  
  delegate :url, :current_path, :content_type, to: :data

  validates :data, presence: true
end
