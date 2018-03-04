ActiveAdmin.register Topic do

  permit_params :name, :course_id
  menu priority: 2
  index do
    column :id
    column :name
    column :course
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
