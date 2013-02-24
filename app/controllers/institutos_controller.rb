class InstitutosController < ApplicationController
  load_and_authorize_resource

  # GET /institutos
  # GET /institutos.xml
  def index
    @institutos = Instituto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @institutos }
    end
  end

  # GET /institutos/1
  # GET /institutos/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @instituto }
    end
  end

  # GET /institutos/new
  # GET /institutos/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @instituto }
    end
  end

  # GET /institutos/1/edit
  def edit
  end

  # POST /institutos
  # POST /institutos.xml
  def create
    respond_to do |format|
      if @instituto.save
        format.html { redirect_to(@instituto, :notice => 'Instituto fue creado exitosamente.') }
        format.xml  { render :xml => @instituto, :status => :created, :location => @instituto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @instituto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /institutos/1
  # PUT /institutos/1.xml
  def update
    respond_to do |format|
      if @instituto.update_attributes(params[:instituto])
        format.html { redirect_to(@instituto, :notice => 'Instituto fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @instituto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /institutos/1
  # DELETE /institutos/1.xml
  def destroy
    @instituto.destroy

    respond_to do |format|
      format.html { redirect_to(institutos_url) }
      format.xml  { head :ok }
    end
  end
end
