ActiveAdmin.register Species do

	permit_params :name, :located
		sidebar "Reports", only: [:show, :edit] do
		ul do
			li link_to "Reports", admin_species_reports_path(resource)
		end
	end

  filter :name 

	index do
		selectable_column
		actions
		column :name
		column :located
	end


end

