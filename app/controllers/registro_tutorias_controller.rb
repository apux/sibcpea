class RegistroTutoriasController < ApplicationController
  load_and_authorize_resource
  
  # GET /registro_tutorias
  # GET /registro_tutorias.xml
  def index
    @registro_tutorias = RegistroTutoria.joins(:tutoria).where("tutorias.profesor_id" => usuario_actual.profesor_id)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registro_tutorias }
    end
  end

  # GET /registro_tutorias/1
  # GET /registro_tutorias/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @registro_tutoria }
    end
  end

  # GET /registro_tutorias/new
  # GET /registro_tutorias/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @registro_tutoria }
    end
  end

  # GET /registro_tutorias/1/edit
  def edit
  end

  # POST /registro_tutorias
  # POST /registro_tutorias.xml
  def create
    respond_to do |format|
      if @registro_tutoria.save
        format.html { redirect_to(@registro_tutoria, :notice => 'Registro tutoria fue creado exitosamente.') }
        format.xml  { render :xml => @registro_tutoria, :status => :created, :location => @registro_tutoria }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @registro_tutoria.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /registro_tutorias/1
  # PUT /registro_tutorias/1.xml
  def update
    respond_to do |format|
      if @registro_tutoria.update_attributes(params[:registro_tutoria])
        format.html { redirect_to(@registro_tutoria, :notice => 'Registro tutoria fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @registro_tutoria.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /registro_tutorias/1
  # DELETE /registro_tutorias/1.xml
  def destroy
    @registro_tutoria.destroy

    respond_to do |format|
      format.html { redirect_to(registro_tutorias_url) }
      format.xml  { head :ok }
    end
  end
end
