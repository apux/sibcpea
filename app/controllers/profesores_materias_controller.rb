class ProfesoresMateriasController < ApplicationController
  load_and_authorize_resource
  
  # GET /profesores_materias
  # GET /profesores_materias.xml
  def index
    @profesores_materias = ProfesorMateria.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profesores_materias }
    end
  end

  # GET /profesores_materias/1
  # GET /profesores_materias/1.xml
  def show
    @profesor_materia = ProfesorMateria.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profesor_materia }
    end
  end

  # GET /profesores_materias/new
  # GET /profesores_materias/new.xml
  def new
    @profesor_materia = ProfesorMateria.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profesor_materia }
    end
  end

  # GET /profesores_materias/1/edit
  def edit
    @profesor_materia = ProfesorMateria.find(params[:id])
  end

  # POST /profesores_materias
  # POST /profesores_materias.xml
  def create
    @profesor_materia = ProfesorMateria.new(params[:profesor_materia])

    respond_to do |format|
      if @profesor_materia.save
        format.html { redirect_to(@profesor_materia, :notice => 'Profesor materia fue creado exitosamente.') }
        format.xml  { render :xml => @profesor_materia, :status => :created, :location => @profesor_materia }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profesor_materia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profesores_materias/1
  # PUT /profesores_materias/1.xml
  def update
    @profesor_materia = ProfesorMateria.find(params[:id])

    respond_to do |format|
      if @profesor_materia.update_attributes(params[:profesor_materia])
        format.html { redirect_to(@profesor_materia, :notice => 'Profesor materia fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profesor_materia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profesores_materias/1
  # DELETE /profesores_materias/1.xml
  def destroy
    @profesor_materia = ProfesorMateria.find(params[:id])
    @profesor_materia.destroy

    respond_to do |format|
      format.html { redirect_to(profesores_materias_url) }
      format.xml  { head :ok }
    end
  end
end
