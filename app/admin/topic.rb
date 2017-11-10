ActiveAdmin.register Topic do
  permit_params :name, :course_id
  menu priority: 2
  index do
    column :id
    column :name
    column :course
    actions
  end
end
