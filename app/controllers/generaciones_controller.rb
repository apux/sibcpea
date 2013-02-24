class GeneracionesController < ApplicationController
  load_and_authorize_resource
  
  # GET /generaciones
  # GET /generaciones.xml
  def index
    @generaciones = Generacion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @generaciones }
    end
  end

  # GET /generaciones/1
  # GET /generaciones/1.xml
  def show
    @generacion = Generacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @generacion }
    end
  end

  # GET /generaciones/new
  # GET /generaciones/new.xml
  def new
    @generacion = Generacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @generacion }
    end
  end

  # GET /generaciones/1/edit
  def edit
    @generacion = Generacion.find(params[:id])
  end

  # POST /generaciones
  # POST /generaciones.xml
  def create
    @generacion = Generacion.new(params[:generacion])

    respond_to do |format|
      if @generacion.save
        format.html { redirect_to(@generacion, :notice => 'Generacion fue creado exitosamente.') }
        format.xml  { render :xml => @generacion, :status => :created, :location => @generacion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @generacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /generaciones/1
  # PUT /generaciones/1.xml
  def update
    @generacion = Generacion.find(params[:id])

    respond_to do |format|
      if @generacion.update_attributes(params[:generacion])
        format.html { redirect_to(@generacion, :notice => 'Generacion fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @generacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /generaciones/1
  # DELETE /generaciones/1.xml
  def destroy
    @generacion = Generacion.find(params[:id])
    @generacion.destroy

    respond_to do |format|
      format.html { redirect_to(generaciones_url) }
      format.xml  { head :ok }
    end
  end
end
