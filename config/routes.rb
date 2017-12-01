Rails.application.routes.draw do
	# Devise
  devise_for :users, ActiveAdmin::Devise.config
  # Active Admin
  ActiveAdmin.routes(self)
  # CK Editor
  mount Ckeditor::Engine => '/ckeditor'
  # Application
  root 'documents#index'
  get '/documents/:id', to: 'documents#show', as: :document
end
