module PostsHelper
  include ActsAsTaggableOn::TagsHelper

  def post_format post
    return 'image' if post.image_url
    return 'video' if post.youtube_id.present?
    return 'text'
  end

  private

  def tag_link tag
    link_to tag.name, tag_path(tag)
  end
end
