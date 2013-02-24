class AsistenciasController < ApplicationController
  load_and_authorize_resource
  
  # GET /asistencias
  # GET /asistencias.xml
  def index
    @asistencias = Asistencia.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @asistencias }
    end
  end

  # GET /asistencias/1
  # GET /asistencias/1.xml
  def show
    @asistencia = Asistencia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @asistencia }
    end
  end

  # GET /asistencias/new
  # GET /asistencias/new.xml
  def new
    @asistencia = Asistencia.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @asistencia }
    end
  end

  # GET /asistencias/1/edit
  def edit
    @asistencia = Asistencia.find(params[:id])
  end

  # POST /asistencias
  # POST /asistencias.xml
  def create
    @asistencia = Asistencia.new(params[:asistencia])

    respond_to do |format|
      if @asistencia.save
        format.html { redirect_to(@asistencia, :notice => 'Asistencia fue creado exitosamente.') }
        format.xml  { render :xml => @asistencia, :status => :created, :location => @asistencia }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @asistencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /asistencias/1
  # PUT /asistencias/1.xml
  def update
    @asistencia = Asistencia.find(params[:id])

    respond_to do |format|
      if @asistencia.update_attributes(params[:asistencia])
        unless params[:redirect]       
          format.html { redirect_to(@asistencia, :notice => 'Asistencia fue modificado exitosamente.') }
        else
          format.html { redirect_to :back, :notice => "Se guardó correctamente la asistencia" }
        end
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @asistencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /asistencias/1
  # DELETE /asistencias/1.xml
  def destroy
    @asistencia = Asistencia.find(params[:id])
    @asistencia.destroy

    respond_to do |format|
      format.html { redirect_to(asistencias_url) }
      format.xml  { head :ok }
    end
  end
end
