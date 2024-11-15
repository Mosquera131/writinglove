class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :role ])# Agrega otros campos si es necesario
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :role ])  # Agregar al actualizar cuenta
  end
end
