class PaymentsController < ApplicationController

  layout false
  # load_and_authorize_resource :class => PaymentsController

  before_action :authenticate_user!

  def index
  end

end
