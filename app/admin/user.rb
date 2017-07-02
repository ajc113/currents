ActiveAdmin.register User do

	filter :state, as: :check_boxes
	permit_params :email, :first_name, :last_name, :home_port, :state_waters, :vessel_name, :subscription_tier

	sidebar "Reports", only: [:show, :edit] do
		ul do
			li link_to "Reports", admin_user_reports_path(resource)
		end
	end
end
