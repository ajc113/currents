ActiveAdmin.register Buzz do

  permit_params :user_id, :post


  index do
    selectable_column
    actions
    column :user_id
    column :post
    column :created_at
    column :updated_at
  end

end
