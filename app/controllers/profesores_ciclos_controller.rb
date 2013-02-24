class ProfesoresCiclosController < ApplicationController
  load_and_authorize_resource
  
  # GET /profesores_ciclos
  # GET /profesores_ciclos.xml
  def index
    if usuario_actual.permiso? :jefe_carrera or usuario_actual.permiso? :secretaria
      @profesores_ciclos = ProfesorCiclo.all
    else
      @profesores_ciclos = usuario_actual.profesor.profesores_ciclos
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profesores_ciclos }
    end
  end

  # GET /profesores_ciclos/1
  # GET /profesores_ciclos/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profesor_ciclo }
    end
  end

  # GET /profesores_ciclos/new
  # GET /profesores_ciclos/new.xml
  def new
    @profesores = Profesor.all
    @ciclo_actual = Ciclo.order("clave ASC").last
    @grupos = Grupo.all
    @materias = Materia.all
    @aulas = Aula.all
     @profesor_ciclo.profesores_materias << ProfesorMateria.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profesor_ciclo }
    end
  end

  # GET /profesores_ciclos/1/edit
  def edit
    @profesores = Profesor.all
    @ciclo_actual = Ciclo.order("clave ASC").last
    @grupos = Grupo.all
    @materias = Materia.all
    @aulas = Aula.all
  end

  # POST /profesores_ciclos
  # POST /profesores_ciclos.xml
  def create
    respond_to do |format|
      if @profesor_ciclo.save
        format.html { redirect_to(@profesor_ciclo, :notice => 'Profesor ciclo fue creado exitosamente.') }
        format.xml  { render :xml => @profesor_ciclo, :status => :created, :location => @profesor_ciclo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profesor_ciclo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profesores_ciclos/1
  # PUT /profesores_ciclos/1.xml
  def update
    respond_to do |format|
      if @profesor_ciclo.update_attributes(params[:profesor_ciclo])
        format.html { redirect_to(@profesor_ciclo, :notice => 'Profesor ciclo fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profesor_ciclo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profesores_ciclos/1
  # DELETE /profesores_ciclos/1.xml
  def destroy
    @profesor_ciclo.destroy

    respond_to do |format|
      format.html { redirect_to(profesores_ciclos_url) }
      format.xml  { head :ok }
    end
  end
end
