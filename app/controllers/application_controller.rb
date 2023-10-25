class ApplicationController < ActionController::Base
# before_action :authenticate_user!, except: [:about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :telephone_number])
  end

  private

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      # adminユーザー
      admin_root_path
      
    else
      # customerユーザー
      root_path
    end
  end
  
  # def after_sign_in_path_for(resource_or_scope)
  #   root_path
  # end

  def after_sign_out_path_for(resource)
    about_path
  end

end
