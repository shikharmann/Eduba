Rails.application.routes.draw do

  # Devise
  devise_for :users, ActiveAdmin::Devise.config
  # Active Admin
  ActiveAdmin.routes(self)
  # CK Editor
  # mount Ckeditor::Engine => '/ckeditor'
  # Application
  root 'home_pages#index'
  get '/about_us', to: 'home_pages#about_us'
  get '/contact_us', to: 'home_pages#contact_us'
  get '/terms_of_service', to: 'home_pages#terms_of_service'
  get '/privacy_policy', to: 'home_pages#privacy_policy'
  get '/refund_policy', to: 'home_pages#refund_policy'
  get '/payments', to: 'payments#index'

  #document routes
  #get '/documents', to: 'documents#index' #default document routes / landing page for documents TODO
  get '/documents/:id', to: 'documents#show', as: :document

  #free content routes
  #get '/free_content', to: 'free_content#index' #default free content routes / landing page TODO
  get '/free_content/:id', to: 'free_contents#show'

end
