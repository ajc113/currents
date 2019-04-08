module ApplicationHelper
  def full_title(page_title = '')
  	base_title = " | Currents Network"
  	if page_title.empty?
  		base_title
  	else
  		page_title + base_title
  	end
  end

  def post_tags post
    return '-' if post.tags.empty?
    raw post.tags.map { |tag| tag_link(tag) }.join(", ")
  end
end
