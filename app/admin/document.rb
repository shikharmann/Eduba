ActiveAdmin.register Document do
  permit_params :name, :subtopic_id
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

  controller do

    def create
      doc = Document.new(params.require(:document).permit(:name, :subtopic_id))
      attached_file = params[:document][:html_file]
      if doc.valid? && attached_file.present? && attached_file.content_type=="text/html"
        doc.save!
        AwsServices::DocumentStorage.new(doc).write(attached_file)
        flash[:notice] = "Document successfully uploaded!! "
        render :index
      else
        flash[:error] = "Something is wrong, check form again..."
      end
    end
  end

end