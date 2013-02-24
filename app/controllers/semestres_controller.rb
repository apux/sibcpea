class SemestresController < ApplicationController
  load_and_authorize_resource
  
  # GET /semestres
  # GET /semestres.xml
  def index
    @semestres = Semestre.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @semestres }
    end
  end

  # GET /semestres/1
  # GET /semestres/1.xml
  def show
    @semestre = Semestre.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @semestre }
    end
  end

  # GET /semestres/new
  # GET /semestres/new.xml
  def new
    @semestre = Semestre.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @semestre }
    end
  end

  # GET /semestres/1/edit
  def edit
    @semestre = Semestre.find(params[:id])
  end

  # POST /semestres
  # POST /semestres.xml
  def create
    @semestre = Semestre.new(params[:semestre])

    respond_to do |format|
      if @semestre.save
        format.html { redirect_to(@semestre, :notice => 'Semestre fue creado exitosamente.') }
        format.xml  { render :xml => @semestre, :status => :created, :location => @semestre }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @semestre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /semestres/1
  # PUT /semestres/1.xml
  def update
    @semestre = Semestre.find(params[:id])

    respond_to do |format|
      if @semestre.update_attributes(params[:semestre])
        format.html { redirect_to(@semestre, :notice => 'Semestre fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @semestre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /semestres/1
  # DELETE /semestres/1.xml
  def destroy
    @semestre = Semestre.find(params[:id])
    @semestre.destroy

    respond_to do |format|
      format.html { redirect_to(semestres_url) }
      format.xml  { head :ok }
    end
  end
end
