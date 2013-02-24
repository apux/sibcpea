class ComentariosController < ApplicationController
  load_and_authorize_resource
  
  # GET /comentarios
  # GET /comentarios.xml
  def index
    @aviso = Aviso.find(params[:aviso_id])
    @comentarios = @aviso.comentarios.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comentarios }
    end
  end

  # GET /comentarios/new
  # GET /comentarios/new.xml
  def new
    aviso = Aviso.find(params[:aviso_id])
    @comentario = Comentario.new :aviso => aviso

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comentario }
    end
  end

  # GET /comentarios/1/edit
  def edit
    aviso = Aviso.find(params[:aviso_id])
    @comentario = Comentario.find(params[:id])
    @comentario = Comentario.new :aviso => aviso
  end

  # POST /comentarios
  # POST /comentarios.xml
  def create
    aviso = Aviso.find params[:aviso_id]
    @comentario = Comentario.new(params[:comentario])
    @comentario.usuario = usuario_actual
    @comentario.aviso = aviso

    respond_to do |format|
      if @comentario.save
        format.html { redirect_to(new_aviso_comentario_path(aviso), :notice => 'Comentario fue creado exitosamente.') }
        format.xml  { render :xml => @comentario, :status => :created, :location => @comentario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comentario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comentarios/1
  # PUT /comentarios/1.xml
  def update
    @comentario = Comentario.find(params[:id])

    respond_to do |format|
      if @comentario.update_attributes(params[:comentario])
        format.html { redirect_to(@comentario, :notice => 'Comentario fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comentario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.xml
  def destroy
    aviso = Aviso.find(params[:aviso_id])
    @comentario = Comentario.find(params[:id])
    @comentario.destroy

    respond_to do |format|
      format.html { redirect_to(aviso_comentarios_url(aviso)) }
      format.xml  { head :ok }
    end
  end
end
