class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
  
    request.env['omniauth.origin'] || stored_location_for(resource) || 
    if resource.is_a?(User)
      dashboard_path
    elsif resource.is_a?(Admin)
      menus_path
    end
    
  end
  
   def current_ability
    if current_admin
      @current_ability ||= AdminAbility.new(current_admin)
    else
      @current_ability ||= UserAbility.new(current_user)
    end
   end
end
