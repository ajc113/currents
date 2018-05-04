ActiveAdmin.register Spot do
permit_params :title, :body, :meta_title, :meta_description, :meta_keywords, :created_at




show do |t|
	attributes_table do
		row :title
		row :body
		row :image
		row :meta_title
		row :meta_description
		row :meta_keywords		
		row :created_at
	end
end

form :html => { :enctype => "multipart/form-data" } do |f|
	f.inputs do
		f.input :title
		f.input :body
		f.input :image
		f.input :meta_title
		f.input :meta_description
		f.input :meta_keywords		
		f.input :created_at

	end
	f.actions
	end
end


