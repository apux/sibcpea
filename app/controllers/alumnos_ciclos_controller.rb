class AlumnosCiclosController < ApplicationController
  load_and_authorize_resource
  
  # GET /alumnos_ciclos
  # GET /alumnos_ciclos.xml
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @alumnos_ciclos }
    end
  end

  # GET /alumnos_ciclos/1
  # GET /alumnos_ciclos/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @alumno_ciclo }
    end
  end

  # GET /alumnos_ciclos/new
  # GET /alumnos_ciclos/new.xml
  def new
    @alumnos = Alumno.all
    @grupos = Grupo.all
    @ciclo_actual = Ciclo.order("clave ASC").last

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @alumno_ciclo }
    end
  end

  # GET /alumnos_ciclos/1/edit
  def edit
    @ciclo_actual = Ciclo.order("clave ASC").last
  end

  # POST /alumnos_ciclos
  # POST /alumnos_ciclos.xml
  def create
    @alumno_ciclo = AlumnoCiclo.new(params[:alumno_ciclo])

    respond_to do |format|
      if @alumno_ciclo.save
        format.html { redirect_to(@alumno_ciclo, :notice => 'Alumno ciclo fue creado exitosamente.') }
        format.xml  { render :xml => @alumno_ciclo, :status => :created, :location => @alumno_ciclo }
      else
        @alumnos = Alumno.all
        @grupos = Grupo.all
        @ciclo_actual = Ciclo.order("clave ASC").last
        format.html { render :action => "new" }
        format.xml  { render :xml => @alumno_ciclo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /alumnos_ciclos/1
  # PUT /alumnos_ciclos/1.xml
  def update

    respond_to do |format|
      if @alumno_ciclo.update_attributes(params[:alumno_ciclo])
        format.html { redirect_to(@alumno_ciclo, :notice => 'Alumno ciclo fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @alumno_ciclo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /alumnos_ciclos/1
  # DELETE /alumnos_ciclos/1.xml
  def destroy
    @alumno_ciclo.destroy

    respond_to do |format|
      format.html { redirect_to(alumnos_ciclos_url) }
      format.xml  { head :ok }
    end
  end
end
