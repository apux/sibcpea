class AsistenciaGruposController < ApplicationController
  load_and_authorize_resource
  
  # GET /asistencia_grupos
  # GET /asistencia_grupos.xml
  def index
    @ciclo_actual = Ciclo.order("clave ASC").last
    pm = usuario_actual.profesor.profesores_materias.includes(:materia, :grupo)
    @materias = pm.collect{|v| v.materia}
    @grupos = pm.collect{|v| v.grupo}
    @materias.compact!
    @grupos.compact!

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @asistencia_grupos }
    end
  end

  # GET /asistencia_grupos/1
  # GET /asistencia_grupos/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @asistencia_grupo }
    end
  end

  # GET /asistencia_grupos/new
  # GET /asistencia_grupos/new.xml
  def new
    @profesor_materias = usuario_actual.profesor.profesores_materias

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @asistencia_grupo }
    end
  end

  # GET /asistencia_grupos/1/edit
  def edit
    @asistencia_grupo = AsistenciaGrupo.find(params[:id])
    @profesor_materias = usuario_actual.profesor.profesores_materias
  end

  # POST /asistencia_grupos
  # POST /asistencia_grupos.xml
  def create
    respond_to do |format|
      if @asistencia_grupo.save
        format.html { redirect_to(@asistencia_grupo, :notice => 'Asistencia grupo fue creado exitosamente.') }
        format.xml  { render :xml => @asistencia_grupo, :status => :created, :location => @asistencia_grupo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @asistencia_grupo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /asistencia_grupos/1
  # PUT /asistencia_grupos/1.xml
  def update
    respond_to do |format|
      if @asistencia_grupo.update_attributes(params[:asistencia_grupo])
        format.html { redirect_to @asistencia_grupo, :notice => "Asistencia fue modificado exitosamente." }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @asistencia_grupo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /asistencia_grupos/1
  # DELETE /asistencia_grupos/1.xml
  def destroy
    @asistencia_grupo.destroy

    respond_to do |format|
      format.html { redirect_to(asistencia_grupos_url) }
      format.xml  { head :ok }
    end
  end

  def lista
    grupo_id = params[:grupo_id]
    mes = params[:fecha]["(2i)"]
    dia = params[:fecha]["(3i)"]
    anio = params[:fecha]["(1i)"]
    materia_id = params[:materia_id]
    profesor_id = usuario_actual.profesor_id

    # Se busca la materia, asegurándose que corresponda a este profesor
    materia = Materia.joins(:profesores_materias => [:profesor_ciclo]).where(
      "profesores_ciclos.profesor_id" => usuario_actual.profesor.id).find(materia_id)
    grupo = Grupo.find(grupo_id)

    fecha = "#{anio}/#{mes}/#{dia}".to_date
    @asistencia_grupo = AsistenciaGrupo.includes(:profesor_materia => [:materia]).where(:fecha => fecha, :grupo_id => grupo.id, "materias.id" => materia.id).first

    # Si no existe la relación asistencia grupo, se crea
    unless  @asistencia_grupo
      query = ProfesorMateria.joins(:profesor_ciclo)
      query = query.where(:materia_id => materia.id, "profesores_ciclos.profesor_id" => profesor_id)
      profesor_materia = query.last
      @asistencia_grupo = AsistenciaGrupo.create(:fecha => fecha, :profesor_materia => profesor_materia, :grupo => grupo)
    end

    @asistencias = @asistencia_grupo.asistencias unless @asistencia_grupo.nil?
    @asistencias ||= []

    alumnos_ciclos_en_asistencias_ids = @asistencias.collect {|acea| acea.alumno_ciclo_id}
    alumnos_ciclos_en_grupo_ids = grupo.alumnos_ciclos.collect {|aceg| aceg.id}
    dif = alumnos_ciclos_en_grupo_ids - alumnos_ciclos_en_asistencias_ids
    for i in dif
      @asistencias << Asistencia.new(:alumno_ciclo => AlumnoCiclo.find(i))
    end

    respond_to do |format|
      format.html { redirect_to(edit_asistencia_grupo_path(@asistencia_grupo)) }
    end
  end

  def genera_reporte
    @grupo = Grupo.find params[:grupo_id]
    mes_i = params[:fecha]["(2i)"]
    dia_i = params[:fecha]["(3i)"]
    anio_i = params[:fecha]["(1i)"]

    @fecha_inicial = "#{anio_i}/#{mes_i}/#{dia_i}".to_date.beginning_of_month
    @fecha_final = @fecha_inicial.at_end_of_month

    # Se busca la materia, asegurándose que corresponda a este profesor
    @materia = Materia.joins(:profesores_materias => [:profesor_ciclo]).where(
      "profesores_ciclos.profesor_id" => usuario_actual.profesor.id).find(params[:materia_id])

    aux = Asistencia.includes(:asistencia_grupo => [:profesor_materia => [:materia]]).where(
      "asistencia_grupos.fecha >= ? AND asistencia_grupos.fecha <= ? AND asistencia_grupos.grupo_id = ? AND materias.id = ?", 
      @fecha_inicial, @fecha_final, @grupo.id, @materia.id
    ).all
    @asistencias_por_fecha = aux.group_by{|a| a.asistencia_grupo.fecha}
    @fechas = @asistencias_por_fecha.keys
    @asistencias_por_fecha.each_pair do |fecha, asistencia| 
      puts fecha
      y asistencia
    end

    render :layout => false
  end
end
