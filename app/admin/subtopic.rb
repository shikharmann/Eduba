ActiveAdmin.register Subtopic do

  permit_params :name, :topic_id
  menu priority: 3
  index do
    column :id
    column :name
    column :topic
    actions
  end

  controller do
    before_filter :admin_filter

    def admin_filter
      raise ActionController::RoutingError.new('Not Found') if current_user.nil?
      redirect_to after_sign_in_path_for(current_user) unless current_user.ADMIN?
    end
  end

end
