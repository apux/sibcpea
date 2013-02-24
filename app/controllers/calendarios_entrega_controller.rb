class CalendariosEntregaController < ApplicationController
  load_and_authorize_resource
  
  # GET /calendarios_entrega
  # GET /calendarios_entrega.xml
  def index
    @calendarios_entrega = CalendarioEntrega.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @calendarios_entrega }
    end
  end

  # GET /calendarios_entrega/1
  # GET /calendarios_entrega/1.xml
  def show
    @calendario_entrega = CalendarioEntrega.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @calendario_entrega }
    end
  end

  # GET /calendarios_entrega/new
  # GET /calendarios_entrega/new.xml
  def new
    @calendario_entrega = CalendarioEntrega.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @calendario_entrega }
    end
  end

  # GET /calendarios_entrega/1/edit
  def edit
    @calendario_entrega = CalendarioEntrega.find(params[:id])
  end

  # POST /calendarios_entrega
  # POST /calendarios_entrega.xml
  def create
    @calendario_entrega = CalendarioEntrega.new(params[:calendario_entrega])

    respond_to do |format|
      if @calendario_entrega.save
        format.html { redirect_to(@calendario_entrega, :notice => 'Calendario entrega fue creado exitosamente.') }
        format.xml  { render :xml => @calendario_entrega, :status => :created, :location => @calendario_entrega }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @calendario_entrega.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /calendarios_entrega/1
  # PUT /calendarios_entrega/1.xml
  def update
    @calendario_entrega = CalendarioEntrega.find(params[:id])

    respond_to do |format|
      if @calendario_entrega.update_attributes(params[:calendario_entrega])
        format.html { redirect_to(@calendario_entrega, :notice => 'Calendario entrega fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @calendario_entrega.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /calendarios_entrega/1
  # DELETE /calendarios_entrega/1.xml
  def destroy
    @calendario_entrega = CalendarioEntrega.find(params[:id])
    @calendario_entrega.destroy

    respond_to do |format|
      format.html { redirect_to(calendarios_entrega_url) }
      format.xml  { head :ok }
    end
  end
end
