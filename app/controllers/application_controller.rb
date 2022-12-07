class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  private


end
