class AvisosController < ApplicationController
  load_and_authorize_resource

  # GET /avisos
  # GET /avisos.xml
  def index
    @avisos = Aviso.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @avisos }
    end
  end

  # GET /avisos/1
  # GET /avisos/1.xml
  def show
    @aviso = Aviso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @aviso }
    end
  end

  # GET /avisos/new
  # GET /avisos/new.xml
  def new
    @aviso = Aviso.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @aviso }
    end
  end

  # GET /avisos/1/edit
  def edit
    @aviso = Aviso.find(params[:id])
  end

  # POST /avisos
  # POST /avisos.xml
  def create
    @aviso = Aviso.new(params[:aviso])
    @aviso.usuario = usuario_actual

    respond_to do |format|
      if @aviso.save
        format.html { redirect_to(new_aviso_comentario_path(@aviso), :notice => 'Aviso fue creado exitosamente.') }
        format.xml  { render :xml => @aviso, :status => :created, :location => @aviso }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @aviso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /avisos/1
  # PUT /avisos/1.xml
  def update
    @aviso = Aviso.find(params[:id])

    respond_to do |format|
      if @aviso.update_attributes(params[:aviso])
        format.html { redirect_to(@aviso, :notice => 'Aviso fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @aviso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /avisos/1
  # DELETE /avisos/1.xml
  def destroy
    @aviso = Aviso.find(params[:id])
    @aviso.destroy

    respond_to do |format|
      format.html { redirect_to(avisos_url) }
      format.xml  { head :ok }
    end
  end

  def consultar
    avisos ||= Aviso.order("updated_at DESC").limit(10).all
    @aviso = avisos[(rand(avisos.size))]
    render :layout => false
  end
end
