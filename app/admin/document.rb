ActiveAdmin.register Document do
  permit_params :name, :subtopic_id, :content
  form partial: 'new_or_edit_form'
  menu priority: 4
  index do
    column :id
    column :name
    column :subtopic
    actions defaults: true do |document|
      link_to('Preview',"/documents/#{document.id}", :target => "_blank")
    end
  end
end
