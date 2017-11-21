ActiveAdmin.register Post do

permit_params :title, :body, :image, :youtube_id, :created_at

show do |t|
	attributes_table do
		row :title
		row :body
		row :youtube_id
		row :created_at
		row :image do
			post.image? ? image_tag(post.image.url, height: '100') : content_tag(:span, "No photo yet")
		end
	end
end

form :html => { :enctype => "multipart/form-data" } do |f|
	f.inputs do
		f.input :title
		f.input :body
		f.input :created_at
		f.input :youtube_id
		f.input :image, hint: f.post.image?  ? image_tag(post.image.url, height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
	end
	f.actions
	end
end

