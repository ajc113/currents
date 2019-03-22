ActiveAdmin.register Intel do
permit_params :title, :body, :created_at




show do |t|
	attributes_table do
		row :title
		row :body
		row :created_at
	end
end

form :html => { :enctype => "multipart/form-data" } do |f|
	f.inputs do
		f.input :title
		f.input :body
		f.input :created_at
	end
	f.actions
	end
end

