ActiveAdmin.setup do |config|
  config.site_title = "Eduba"
  config.authentication_method = :authenticate_user!
  config.current_user_method = :current_user
  config.logout_link_path = :destroy_user_session_path
  config.comments = false
  config.batch_actions = true
  config.localize_format = :long
  config.register_javascript 'tinymce.js'
end
