ActiveAdmin.register Course do
  permit_params :name
  menu priority: 1
  index do
    column :id
    column :name
    actions
  end
end
