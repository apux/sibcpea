class AvancesProgramaticosController < ApplicationController
  load_and_authorize_resource
  
  # GET /avances_programaticos
  # GET /avances_programaticos.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @avances_programaticos }
    end
  end

  # GET /avances_programaticos/1
  # GET /avances_programaticos/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @avance_programatico }
    end
  end

  # GET /avances_programaticos/new
  # GET /avances_programaticos/new.xml
  def new
    @profesores_materias = usuario_actual.profesor.profesores_materias

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @avance_programatico }
    end
  end

  # GET /avances_programaticos/1/edit
  def edit
    @profesores_materias = usuario_actual.profesor.profesores_materias
  end

  # POST /avances_programaticos
  # POST /avances_programaticos.xml
  def create
    respond_to do |format|
      if @avance_programatico.save
        format.html { redirect_to(@avance_programatico, :notice => 'Avance programatico fue creado exitosamente.') }
        format.xml  { render :xml => @avance_programatico, :status => :created, :location => @avance_programatico }
      else
        @profesores_materias = usuario_actual.profesor.profesores_materias
        format.html { render :action => "new" }
        format.xml  { render :xml => @avance_programatico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /avances_programaticos/1
  # PUT /avances_programaticos/1.xml
  def update
    respond_to do |format|
      if @avance_programatico.update_attributes(params[:avance_programatico])
        format.html { redirect_to(@avance_programatico, :notice => 'Avance programatico fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        @profesores_materias = usuario_actual.profesor.profesores_materias
        format.html { render :action => "edit" }
        format.xml  { render :xml => @avance_programatico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /avances_programaticos/1
  # DELETE /avances_programaticos/1.xml
  def destroy
    @avance_programatico.destroy

    respond_to do |format|
      format.html { redirect_to(avances_programaticos_url) }
      format.xml  { head :ok }
    end
  end

  def genera_reporte
    profesores_materias_ids = usuario_actual.profesor.profesores_materias.collect(&:id)
    AvanceProgramatico.where(:profesor_materia_id => profesores_materias_ids).find(params[:id])
    render :layout => false
  end
end
