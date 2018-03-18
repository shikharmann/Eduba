ActiveAdmin.register Document do
  permit_params :name, :subtopic_id, :free_content
  form partial: 'new_or_edit_form'
  menu priority: 4
  index do
    column :id
    column :name
    column :subtopic
    column :free_content
    actions defaults: true do |document|
      link_to('Preview',"/documents/#{document.id}", :target => "_blank")
    end
  end

  controller do
    before_filter :admin_filter

    def admin_filter
      raise ActionController::RoutingError.new('Not Found') if current_user.nil?
      redirect_to after_sign_in_path_for(current_user) unless current_user.ADMIN?
    end

    def update
      doc = Document.find_by_id(params[:id])
      attached_file = params[:document][:html_file]
      if doc.present?
        begin
          ActiveRecord::Base.transaction do
            doc.update(params.require(:document).permit(:name, :subtopic_id, :free_content))
            if attached_file.present? && attached_file.content_type=="text/html"
              AwsServices::DocumentStorage.new(doc).write(attached_file)
            end
          end
          flash[:notice] = "Document successfully uploaded!! "
        rescue Exception => e
          Rails.logger.error(e)
          flash[:error] = "Something went wrong while saving document or uploading file, check logs.."
        end
      else
        flash[:error] = "Document not found"
      end
      render :index
    end

    def create
      doc = Document.new(params.require(:document).permit(:name, :subtopic_id))
      attached_file = params[:document][:html_file]
      if doc.valid? && attached_file.present? && attached_file.content_type=="text/html"
        begin
          ActiveRecord::Base.transaction do
            doc.save!
            AwsServices::DocumentStorage.new(doc).write(attached_file)
          end
          flash[:notice] = "Document successfully uploaded!! "
        rescue Exception => e
          Rails.logger.error(e)
          flash[:error] = "Something went wrong while saving document or uploading file, check logs.."
        end
      else
        flash[:error] = "Invalid Data, check form and submit again"
      end
      render :index
    end
  end

end