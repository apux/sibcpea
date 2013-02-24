class UsuariosController < ApplicationController
  load_and_authorize_resource :except => [:new, :create]
  
  def index
    if usuario_actual.permiso.tipo_permiso == "admin"
      @usuarios = Usuario.all
    else
      @usuarios = []
      @usuarios << usuario_actual
    end
  end

  def new
    @usuario = Usuario.new
    render :layout => 'layouts/login'
  end

  def create
    @usuario = Usuario.new(params[:usuario])
    @usuario.permiso_id = params[:usuario][:permiso_id]
    if @usuario.save
      redirect_to root_url, :notice => "Se ha registrado correctamente"
    else
      @permisos = Permiso.all
      render 'new', :layout => 'layouts/login'
    end
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end

  def update
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        format.html { redirect_to(@usuario, :notice => 'Usuario fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
      end
    end

  end
end
