class ProfesoresController < ApplicationController
  load_and_authorize_resource
  
  # GET /profesores
  # GET /profesores.xml
  def index
    @profesores = Profesor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profesores }
    end
  end

  # GET /profesores/1
  # GET /profesores/1.xml
  def show
    @profesor = Profesor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profesor }
    end
  end

  # GET /profesores/new
  # GET /profesores/new.xml
  def new
    @profesor = Profesor.new
    @institutos = Instituto.all
    1.times { @profesor.telefonos << Telefono.new }
    1.times { @profesor.correos << Correo.new }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profesor }
    end
  end

  # GET /profesores/1/edit
  def edit
    @profesor = Profesor.find(params[:id])
  end

  # POST /profesores
  # POST /profesores.xml
  def create
    @profesor = Profesor.new(params[:profesor])
    #params[:profesor][:instituto] = @profesor.instituto = Instituto.find params[:profesor][:instituto]

    respond_to do |format|
      if @profesor.save
        format.html { redirect_to(@profesor, :notice => 'Profesor fue creado exitosamente.') }
        format.xml  { render :xml => @profesor, :status => :created, :location => @profesor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profesor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profesores/1
  # PUT /profesores/1.xml
  def update
    @profesor = Profesor.find(params[:id])

    respond_to do |format|
      if @profesor.update_attributes(params[:profesor])
        format.html { redirect_to(@profesor, :notice => 'Profesor fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profesor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profesores/1
  # DELETE /profesores/1.xml
  def destroy
    @profesor = Profesor.find(params[:id])
    @profesor.destroy

    respond_to do |format|
      format.html { redirect_to(profesores_url) }
      format.xml  { head :ok }
    end
  end

  def lista_imprimir
    @profesores = Profesor.all
    render :layout => false
  end
end
