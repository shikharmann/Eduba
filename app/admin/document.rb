ActiveAdmin.register Document do
  permit_params :name, :subtopic_id, :content
  form partial: 'new_or_edit_form'
end
