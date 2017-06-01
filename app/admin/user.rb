ActiveAdmin.register User do

remove_filter :state
permit_params :email, :first_name, :last_name, :home_port, :state_waters, :vessel_name, :subscription_tier

    sidebar "Reports", only: [:show, :edit] do
        ul do
            li link_to "Reports", admin_user_reports_path(resource)
        end
    end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
