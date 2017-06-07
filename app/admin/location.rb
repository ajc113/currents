ActiveAdmin.register Location do

	# See permitted parameters documentation:
	# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
	#
	permit_params :number, :short_name, :long_name, :state_waters, :demographic, :coordinates, :lat1, :lng1, :lat2, :lng2, :lat3, :lng3, :lat4, :lng4, :coordinate_file
	remove_filter :state

	index do
		selectable_column
		actions
		column :number
		column :short_name
		column :long_name
		column :state_waters
		column :demographic
	end

	form do |f|
		inputs do
			input :short_name
			input :long_name
			input :number
			input :state, as: :select, include_blank: false
			input :coordinate_file
			input :demographic
		end
		actions
	end
end

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end



