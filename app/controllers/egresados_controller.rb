class EgresadosController < ApplicationController
  load_and_authorize_resource
  
  # GET /egresados
  # GET /egresados.xml
  def index
    @grupos = Grupo.ultimo_semestre.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @egresados }
    end
  end

  # GET /egresados/1
  # GET /egresados/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @egresado }
    end
  end

  # GET /egresados/new
  # GET /egresados/new.xml
  def new
    @alumnos = Alumno.all
    @generaciones = Generacion.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @egresado }
    end
  end

  # GET /egresados/1/edit
  def edit
  end

  # POST /egresados
  # POST /egresados.xml
  def create
    respond_to do |format|
      if @egresado.save
        format.html { redirect_to(@egresado, :notice => 'Egresado fue creado exitosamente.') }
        format.xml  { render :xml => @egresado, :status => :created, :location => @egresado }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @egresado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /egresados/1
  # PUT /egresados/1.xml
  def update
    respond_to do |format|
      if @egresado.update_attributes(params[:egresado])
        format.html { redirect_to(@egresado, :notice => 'Egresado fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @egresado.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /egresados/1
  # DELETE /egresados/1.xml
  def destroy
    @egresado.destroy

    respond_to do |format|
      format.html { redirect_to(egresados_url) }
      format.xml  { head :ok }
    end
  end

  def definir
    g = Grupo.find params[:grupo_id]
    @alumnos = g.alumnos
  end

  def egresar
    alumnos = Alumno.find params[:alumno_ids]
    @egresados = alumnos.collect do |a|
      egresado = Egresado.new :alumno => a, :generacion_id => params[:generacion_id]
      egresado.save!
      egresado
    end
  rescue Exception => e
    mensaje_generico = "Ocurrió un error al procesar la operación. Es posible que algunos datos no se hayan guardado adecuadamente."
    flash[:alert] = "#{mensaje_generico}<br />#{e}".html_safe
    redirect_to :action => :definir, :grupo_id => alumnos[0].grupos.last
  end

  def lista
    @egresados = Egresado.all.group_by(&:generacion)
  end
end
