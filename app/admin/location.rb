ActiveAdmin.register Location do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :short_name, :long_name, :coordinates, :lat1, :lng1, :lat2, :lng2, :lat3, :lng3, :lat4, :lng4, :lat5, :lng5, :lat6, :lng6, :lat7, :lng7

 form do |f|
    f.inputs do
      f.input :short_name
      f.input :long_name
      f.input :lat1
      f.input :lng1
      f.input :lat2
      f.input :lng2
      f.input :lat3
      f.input :lng3
      f.input :lat4
      f.input :lng4
      f.input :lat5
      f.input :lng5
      f.input :lat6
      f.input :lng6
      f.input :lat7
      f.input :lng7
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
