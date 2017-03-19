ActiveAdmin.register Location do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :number, :short_name, :long_name, :state_waters, :demographic, :coordinates, :lat1, :lng1, :lat2, :lng2, :lat3, :lng3, :lat4, :lng4, :coordinate_file


index do
actions
  column :number
  column :short_name
  column :long_name
  column :state_waters
  column :demographic
end





 # form do |f|
 #    f.inputs do
 #      f.input :short_name
 #      f.input :long_name
 #      # f.input :state_waters
 #      # f.input :demographic
 #      if action_name == 'new'
 #        # f.input :lat1
 #        # f.input :lng1
 #        # f.input :lat2
 #        # f.input :lng2
 #        # f.input :lat3
 #        # f.input :lng3
 #        # f.input :lat4
 #        # f.input :lng4
 #        # f.input :coordinates, as: :text
 #        f.input :coordinate_file
 #      elsif action_name == 'edit'
 #        # f.input :coordinates, as: :text
 #        f.input :coordinate_file
 #      end
 #    end
 #    f.actions
 #  end

end

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end



