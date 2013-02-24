class CiclosController < ApplicationController
  load_and_authorize_resource
  
  # GET /ciclos
  # GET /ciclos.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ciclos }
    end
  end

  # GET /ciclos/1
  # GET /ciclos/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ciclo }
    end
  end

  # GET /ciclos/new
  # GET /ciclos/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ciclo }
    end
  end

  # GET /ciclos/1/edit
  def edit
  end

  # POST /ciclos
  # POST /ciclos.xml
  def create
    respond_to do |format|
      if @ciclo.save
        format.html { redirect_to(@ciclo, :notice => 'Ciclo fue creado exitosamente.') }
        format.xml  { render :xml => @ciclo, :status => :created, :location => @ciclo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ciclo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ciclos/1
  # PUT /ciclos/1.xml
  def update
    respond_to do |format|
      if @ciclo.update_attributes(params[:ciclo])
        format.html { redirect_to(@ciclo, :notice => 'Ciclo fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ciclo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ciclos/1
  # DELETE /ciclos/1.xml
  def destroy
    @ciclo.destroy

    respond_to do |format|
      format.html { redirect_to(ciclos_url) }
      format.xml  { head :ok }
    end
  end
end
