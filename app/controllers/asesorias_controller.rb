class AsesoriasController < ApplicationController
  load_and_authorize_resource

  # GET /asesorias
  # GET /asesorias.xml
  def index
    @asesorias = usuario_actual.profesor.asesorias.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @asesorias }
    end
  end

  # GET /asesorias/1
  # GET /asesorias/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @asesoria }
    end
  end

  # GET /asesorias/new
  # GET /asesorias/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @asesoria }
    end
  end

  # GET /asesorias/1/edit
  def edit
  end

  # POST /asesorias
  # POST /asesorias.xml
  def create
    @asesoria.profesor = usuario_actual.profesor

    respond_to do |format|
      if @asesoria.save
        format.html { redirect_to(@asesoria, :notice => 'Asesoria fue creada exitosamente.') }
        format.xml  { render :xml => @asesoria, :status => :created, :location => @asesoria }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @asesoria.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /asesorias/1
  # PUT /asesorias/1.xml
  def update
    respond_to do |format|
      if @asesoria.update_attributes(params[:asesoria])
        format.html { redirect_to(@asesoria, :notice => 'Asesoria fue modificada exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @asesoria.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /asesorias/1
  # DELETE /asesorias/1.xml
  def destroy
    @asesoria.destroy

    respond_to do |format|
      format.html { redirect_to(asesorias_url) }
      format.xml  { head :ok }
    end
  end

  def genera_reporte
    @reporte_numero = params[:numero].to_i
    raise "Número de reporte no es un número válido" unless @reporte_numero > 0
    mes_i = params[:fecha_inicial]["(2i)"]
    dia_i = params[:fecha_inicial]["(3i)"]
    anio_i = params[:fecha_inicial]["(1i)"]
    mes_f = params[:fecha_final]["(2i)"]
    dia_f = params[:fecha_final]["(3i)"]
    anio_f = params[:fecha_final]["(1i)"]
    profesor_id = usuario_actual.profesor_id

    @fecha_inicial = "#{anio_i}/#{mes_i}/#{dia_i}".to_date
    @fecha_final = "#{anio_f}/#{mes_f}/#{dia_f}".to_date


    @asesorias = usuario_actual.profesor.asesorias.where("fecha >= ? AND fecha <= ?", @fecha_inicial, @fecha_final).all

    render :layout => false
  rescue Exception => e
    flash[:alert] = e.to_s
    redirect_to reporte_asesorias_path
  end
end
