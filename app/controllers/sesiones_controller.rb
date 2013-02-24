class SesionesController < ApplicationController
  def new
    render :layout => 'layouts/login'
  end

  def create
    usuario = Usuario.authenticate(params[:login], params[:password])
    if usuario
      session[:usuario_id] = usuario.id
      redirect_to home_url, :notice => "Ha ingresado correctamente al sistema"
    else
      flash.now.alert = "Password o nombre de usuario inválido"
      render 'new', :layout => 'layouts/login'
    end
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to root_url, :notice => "Ha abandonado el sistema"
  end

end
