class CalendarioRecursosController < ApplicationController
  load_and_authorize_resource
  
  # GET /calendario_recursos
  # GET /calendario_recursos.xml
  def index
    @calendario_recursos = CalendarioRecurso.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @calendario_recursos }
    end
  end

  # GET /calendario_recursos/1
  # GET /calendario_recursos/1.xml
  def show
    @calendario_recurso = CalendarioRecurso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @calendario_recurso }
    end
  end

  # GET /calendario_recursos/new
  # GET /calendario_recursos/new.xml
  def new
    @calendario_recurso = CalendarioRecurso.new
    @recursos_laboratorio = RecursoLaboratorio.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @calendario_recurso }
    end
  end

  # GET /calendario_recursos/1/edit
  def edit
    @calendario_recurso = CalendarioRecurso.find(params[:id])
    @recursos_laboratorio = RecursoLaboratorio.all

  end

  # POST /calendario_recursos
  # POST /calendario_recursos.xml
  def create
    @calendario_recurso = CalendarioRecurso.new(params[:calendario_recurso])

    respond_to do |format|
      if @calendario_recurso.save
        format.html { redirect_to(@calendario_recurso, :notice => 'Calendario recurso fue creado exitosamente.') }
        format.xml  { render :xml => @calendario_recurso, :status => :created, :location => @calendario_recurso }
      else
        @recursos_laboratorio = RecursoLaboratorio.all
        format.html { render :action => "new" }
        format.xml  { render :xml => @calendario_recurso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /calendario_recursos/1
  # PUT /calendario_recursos/1.xml
  def update
    @calendario_recurso = CalendarioRecurso.find(params[:id])

    respond_to do |format|
      if @calendario_recurso.update_attributes(params[:calendario_recurso])
        format.html { redirect_to(@calendario_recurso, :notice => 'Calendario recurso fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @calendario_recurso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /calendario_recursos/1
  # DELETE /calendario_recursos/1.xml
  def destroy
    @calendario_recurso = CalendarioRecurso.find(params[:id])
    @calendario_recurso.destroy

    respond_to do |format|
      format.html { redirect_to(calendario_recursos_url) }
      format.xml  { head :ok }
    end
  end
end
