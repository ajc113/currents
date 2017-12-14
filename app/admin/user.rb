ActiveAdmin.register User do

	permit_params :email, :first_name, :last_name, :home_port, :state_waters, :vessel_name, :subscription_tier
	filter :state, as: :check_boxes
  filter :created_at, label: 'Sign up date'
  filter :subscription_tier, as: :select

 


  index do
    selectable_column
    actions
    column :email
    column :subscription_tier
    column :first_name
    column :last_name
    column :vessel_name
    column :state
    column :sign_in_count
  end


	sidebar "Reports", only: [:show, :edit] do
		ul do
			li link_to "Reports", admin_user_reports_path(resource)
		end
	end
end
