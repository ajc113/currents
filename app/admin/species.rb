ActiveAdmin.register Species do

permit_params :name, :state_waters, :located

  index do
    selectable_column
    actions
    column :name
    column :state_waters
    column :located
  end


end

