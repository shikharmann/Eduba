class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.ADMIN?
      admin_dashboard_path
    elsif resource.CUSTOMER?
      document_path(Document.first)
    elsif resource.VISITOR?
      payments_path
    else
      root_url
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    if current_user.nil?
      redirect_to root_url, alert: exception.message
    else
      redirect_to after_sign_in_path_for(current_user), alert: exception.message
    end
  end
end
