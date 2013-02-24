class PermisosController < ApplicationController
  load_and_authorize_resource
  
  # GET /permisos
  # GET /permisos.xml
  def index
    @permisos = Permiso.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @permisos }
    end
  end

  # GET /permisos/1
  # GET /permisos/1.xml
  def show
    @permiso = Permiso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @permiso }
    end
  end

  # GET /permisos/new
  # GET /permisos/new.xml
  def new
    @permiso = Permiso.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @permiso }
    end
  end

  # GET /permisos/1/edit
  def edit
    @permiso = Permiso.find(params[:id])
  end

  # POST /permisos
  # POST /permisos.xml
  def create
    @permiso = Permiso.new(params[:permiso])

    respond_to do |format|
      if @permiso.save
        format.html { redirect_to(@permiso, :notice => 'Permiso fue creado exitosamente.') }
        format.xml  { render :xml => @permiso, :status => :created, :location => @permiso }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @permiso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /permisos/1
  # PUT /permisos/1.xml
  def update
    @permiso = Permiso.find(params[:id])

    respond_to do |format|
      if @permiso.update_attributes(params[:permiso])
        format.html { redirect_to(@permiso, :notice => 'Permiso fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @permiso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /permisos/1
  # DELETE /permisos/1.xml
  def destroy
    @permiso = Permiso.find(params[:id])
    @permiso.destroy

    respond_to do |format|
      format.html { redirect_to(permisos_url) }
      format.xml  { head :ok }
    end
  end
end
