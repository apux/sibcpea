class AulasController < ApplicationController
  load_and_authorize_resource
  
  # GET /aulas
  # GET /aulas.xml
  def index
    @aulas = Aula.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @aulas }
    end
  end

  # GET /aulas/1
  # GET /aulas/1.xml
  def show
    @aula = Aula.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @aula }
    end
  end

  # GET /aulas/new
  # GET /aulas/new.xml
  def new
    @aula = Aula.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @aula }
    end
  end

  # GET /aulas/1/edit
  def edit
    @aula = Aula.find(params[:id])
  end

  # POST /aulas
  # POST /aulas.xml
  def create
    @aula = Aula.new(params[:aula])

    respond_to do |format|
      if @aula.save
        format.html { redirect_to(@aula, :notice => 'Aula fue creado exitosamente.') }
        format.xml  { render :xml => @aula, :status => :created, :location => @aula }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @aula.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /aulas/1
  # PUT /aulas/1.xml
  def update
    @aula = Aula.find(params[:id])

    respond_to do |format|
      if @aula.update_attributes(params[:aula])
        format.html { redirect_to(@aula, :notice => 'Aula fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @aula.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /aulas/1
  # DELETE /aulas/1.xml
  def destroy
    @aula = Aula.find(params[:id])
    @aula.destroy

    respond_to do |format|
      format.html { redirect_to(aulas_url) }
      format.xml  { head :ok }
    end
  end
end
