class CalificacionesController < ApplicationController
  load_and_authorize_resource
  
  # GET /calificaciones
  # GET /calificaciones.xml
  def index
    if usuario_actual.permiso? :jefe_carrera or usuario_actual.permiso? :secretaria
      @calificaciones = Calificacion.del_ciclo_actual
    else
      @calificaciones = Calificacion.del_ciclo_actual.joins(:profesor_materia => [:profesor_ciclo]).where(
        "profesores_ciclos.profesor_id" => usuario_actual.profesor_id)
    end

    @materias_del_profesor = usuario_actual.profesor.profesores_materias
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @calificaciones }
    end
  end

  # GET /calificaciones/1
  # GET /calificaciones/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @calificacion }
    end
  end

  # GET /calificaciones/new
  # GET /calificaciones/new.xml
  def new
    @profesor_materia = usuario_actual.profesor.profesores_materias.find params[:profesor_materia]
    @alumnos_ciclos = @profesor_materia.alumnos_ciclos

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @calificacion }
    end
  end

  # GET /calificaciones/1/edit
  def edit
    @profesor_materia = usuario_actual.profesor.profesores_materias.find params[:id]
    @alumnos_ciclos = @profesor_materia.alumnos_ciclos
  end

  # POST /calificaciones
  # POST /calificaciones.xml
  def create
    respond_to do |format|
      if @calificacion.save
        format.html { redirect_to(@calificacion, :notice => 'Calificacion fue creado exitosamente.') }
        format.xml  { render :xml => @calificacion, :status => :created, :location => @calificacion }
      else
        @materias_del_profesor = usuario_actual.profesor.profesores_materias
        format.html { render :action => "new" }
        format.xml  { render :xml => @calificacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /calificaciones/1
  # PUT /calificaciones/1.xml
  def update
    respond_to do |format|
      if @calificacion.update_attributes(params[:calificacion])
        format.html { redirect_to(@calificacion, :notice => 'Calificacion fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        @materias_del_profesor = usuario_actual.profesor.profesores_materias
        format.html { render :action => "edit" }
        format.xml  { render :xml => @calificacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /calificaciones/1
  # DELETE /calificaciones/1.xml
  def destroy
    @calificacion.destroy

    respond_to do |format|
      format.html { redirect_to(calificaciones_url) }
      format.xml  { head :ok }
    end
  end

  def genera_reporte
    mes_a = params[:fecha_aplicacion]["(2i)"]
    dia_a = params[:fecha_aplicacion]["(3i)"]
    anio_a = params[:fecha_aplicacion]["(1i)"]
    mes_e = params[:fecha_entrega]["(2i)"]
    dia_e = params[:fecha_entrega]["(3i)"]
    anio_e = params[:fecha_entrega]["(1i)"]

    @fecha_aplicacion = "#{anio_a}/#{mes_a}/#{dia_a}".to_date
    @fecha_entrega = "#{anio_e}/#{mes_e}/#{dia_e}".to_date
    @materia = Materia.find params[:materia_id]
    @grupo = Grupo.find params[:grupo_id]
    @examen = params[:examen]

    @calificaciones = Calificacion.joins(:alumno_ciclo => :grupo).where("grupos.id" => @grupo.id).all

    render :layout => false
  end
end
