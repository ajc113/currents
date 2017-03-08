ActiveAdmin.register Specie do

permit_params :primary_species, :state_waters, :located

  index do
    selectable_column
    actions
    column :primary_species
    column :state_waters
    column :located
  end


end

