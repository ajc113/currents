ActiveAdmin.register Species do

  permit_params :species, :state_waters, :located


  index do
    selectable_column
    actions
    column :species
    column :state_waters
    column :located
  end

end