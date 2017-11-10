ActiveAdmin.register Subtopic do
  permit_params :name, :topic_id
  menu priority: 3
  index do
    column :id
    column :name
    column :topic
    actions
  end
end
