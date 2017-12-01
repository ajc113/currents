class Ckeditor::AttachmentFile < Ckeditor::Asset
  mount_uploader :data, CkeditorAttachmentFileUploader, mount_on: :data_file_name
  belongs_to: :posts

  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end
end
