class TutoriasController < ApplicationController
  load_and_authorize_resource
  
  # GET /tutorias
  # GET /tutorias.xml
  def index
    @tutorias = Tutoria.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tutorias }
    end
  end

  # GET /tutorias/1
  # GET /tutorias/1.xml
  def show
    @tutoria = Tutoria.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tutoria }
    end
  end

  # GET /tutorias/new
  # GET /tutorias/new.xml
  def new
    @tutoria = Tutoria.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tutoria }
    end
  end

  # GET /tutorias/1/edit
  def edit
    @tutoria = Tutoria.find(params[:id])
  end

  # POST /tutorias
  # POST /tutorias.xml
  def create
    @tutoria = Tutoria.new(params[:tutoria])

    respond_to do |format|
      if @tutoria.save
        format.html { redirect_to(@tutoria, :notice => 'Tutoria fue creado exitosamente.') }
        format.xml  { render :xml => @tutoria, :status => :created, :location => @tutoria }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tutoria.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tutorias/1
  # PUT /tutorias/1.xml
  def update
    @tutoria = Tutoria.find(params[:id])

    respond_to do |format|
      if @tutoria.update_attributes(params[:tutoria])
        format.html { redirect_to(@tutoria, :notice => 'Tutoria fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tutoria.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorias/1
  # DELETE /tutorias/1.xml
  def destroy
    @tutoria = Tutoria.find(params[:id])
    @tutoria.destroy

    respond_to do |format|
      format.html { redirect_to(tutorias_url) }
      format.xml  { head :ok }
    end
  end

  def genera_reporte
    mes_i = params[:fecha]["(2i)"]
    dia_i = params[:fecha]["(3i)"]
    anio_i = params[:fecha]["(1i)"]

    @fecha_inicial = "#{anio_i}/#{mes_i}/#{dia_i}".to_date.beginning_of_month
    @fecha_final = @fecha_inicial.at_end_of_month

    @tutorias = usuario_actual.profesor.registro_tutorias.where("fecha >= ? AND fecha <= ?", @fecha_inicial, @fecha_final).all

    render :layout => false
  rescue Exception => e
    flash[:alert] = e.to_s
    redirect_to reporte_tutorias_path
  end
end
