ActiveAdmin.setup do |config|
  config.site_title = "Eduba"
  config.authorization_adapter = ActiveAdmin::CanCanAdapter
  config.authentication_method = :authenticate_user!
  config.current_user_method = :current_user
  config.logout_link_path = :destroy_user_session_path
  config.comments = false
  config.batch_actions = true
  config.localize_format = :long
  config.register_javascript 'ckeditor/init.js'
  # config.on_unauthorized_access = :access_denied
end
