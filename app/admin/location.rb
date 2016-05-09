ActiveAdmin.register Location do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :short_name, :long_name, :coordinates

 form do |f|
    f.inputs do
      f.input :short_name
      f.input :long_name
      f.input :coordinates, as: :text
    end
    f.actions
  end



#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
