ActiveAdmin.register Species do

permit_params :name, :state_waters, :located
    
    sidebar "Reports", only: [:show, :edit] do
        ul do
            li link_to "Reports", admin_species_reports_path(resource)
        end
    end

  index do
    selectable_column
    actions
    column :name
    column :state_waters
    column :located
  end


end

