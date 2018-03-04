ActiveAdmin.register User do

  permit_params :email, :role

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      # f.input :password
      # f.input :password_confirmation
      f.input :role, label: 'select role', as: :select, collection: User.roles.keys.to_a, include_blank: false
    end
    f.actions
  end

  controller do
    before_filter :admin_filter

    def admin_filter
      raise ActionController::RoutingError.new('Not Found') if current_user.nil?
      redirect_to after_sign_in_path_for(current_user) unless current_user.ADMIN?
    end
  end

end
