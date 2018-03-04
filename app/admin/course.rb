ActiveAdmin.register Course do

  permit_params :name
  menu priority: 1
  index do
    column :id
    column :name
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
