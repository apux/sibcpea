class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :usuario_actual, :current_user

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to access_denied_url, :alert => 'Usted no tiene permiso para acceder a esta página'
  end

  rescue_from ActiveRecord::RecordNotFound, :with => :rescue_not_found

  ###############
  private
  ###############

  def usuario_actual
    @usuario_actual ||= Usuario.find(session[:usuario_id]) if session[:usuario_id]
  end

  def current_user
    usuario_actual
  end

  def access_denied_url
    current_user ? home_url : root_url
  end

  def rescue_not_found
    flash.now[:alert] = 'No se encontró el recurso solicitado, o hubo un error interno.'
    render :template => (current_user ? '/home/index' : '/'), :status => :not_found
  end

end
