class LaboratoriosController < ApplicationController
  load_and_authorize_resource :except => [:semana]
  
  # GET /laboratorios
  # GET /laboratorios.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @laboratorios }
    end
  end

  # GET /laboratorios/1
  # GET /laboratorios/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @laboratorio }
    end
  end

  # GET /laboratorios/new
  # GET /laboratorios/new.xml
  def new
    @laboratorio.recursos_laboratorio << RecursoLaboratorio.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @laboratorio }
    end
  end

  # GET /laboratorios/1/edit
  def edit
  end

  # POST /laboratorios
  # POST /laboratorios.xml
  def create
    respond_to do |format|
      if @laboratorio.save
        format.html { redirect_to(@laboratorio, :notice => 'Laboratorio fue creado exitosamente.') }
        format.xml  { render :xml => @laboratorio, :status => :created, :location => @laboratorio }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @laboratorio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /laboratorios/1
  # PUT /laboratorios/1.xml
  def update
    respond_to do |format|
      if @laboratorio.update_attributes(params[:laboratorio])
        format.html { redirect_to(@laboratorio, :notice => 'Laboratorio fue modificado exitosamente.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @laboratorio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /laboratorios/1
  # DELETE /laboratorios/1.xml
  def destroy
    @laboratorio.destroy

    respond_to do |format|
      format.html { redirect_to(laboratorios_url) }
      format.xml  { head :ok }
    end
  end

  def seleccionar
  end

  def semana
    # Se verifica que exista el id recibido, si no, se busca el primer laboratorio, si no hay ninguno, se asigna nil
    if Laboratorio.exists?(params[:id])
      @laboratorio_id = params[:id].to_i
    else
      l = Laboratorio.first
      @laboratorio_id = l.id if l
    end

    # Si se encontró un laboratorio, se procesa, si no, se manda un mensaje de error
    if @laboratorio_id
      authorize! :semana, Laboratorio

      # Se toma el número de semana de params, si no existe, se toma el número de semana actual
      @numero_semana = params[:numero_semana].blank? ? Date.today.cweek : params[:numero_semana].to_i

      # Se genera un rango de 7 días (del domingo semana hasta el sábado de esta semana)
      d1 = Date.today.beginning_of_year.sunday + 7 * @numero_semana
      d2 = d1 + 6

      # Se toman los calendarios de los recursos del laboratorio en el rango de fechas calculado
      calendario_recursos = CalendarioRecurso.joins(:recurso_laboratorio).where("fecha > ? and fecha <= ? and laboratorio_id = ?", d1, d2, @laboratorio_id)


      # Se genera el calendario vacío por medio de un hash donde cada llave es un día en el rango de
      # fechas calculadas, y cada valor es otro hash, que tiene de llave cada hora, y de valor 
      # un arreglo vacío. 
      # Ej. {"01/01/2011" => {0 => [], 1 => [], 2 => [] ...}, "02/01/2011" => {0 => [], 1 => [], 2 => [], ...}, etc.. }
      @dias = (d1..d2).to_a
      @calendario = {}
      @dias.to_a.each do |d| 
        @calendario[d] = {}
        (0..23).to_a.each{|h| @calendario[d][h] = []}
      end


      # Se llena el calendario que se creó vacío. Se recorren los calendarios de la bd, se toma su hora 
      # de inicio y hora de fin, y se agregan en el valor de hash correspondiente.
      # Ej. {"01/01/2011" => {0 => [], 1 => [#cr], 2 => [#cr], 3 => [], 4 => [] ...}, etc...}
      calendario_recursos.each do |cr| 
        total_horas = cr.hora_fin.hour - cr.hora_inicio.hour
        for i in 0..total_horas
          @calendario[cr.fecha][cr.hora_inicio.hour + i] << cr
        end
      end # Fin de each
    else
      flash[:alert] = "Debe dar de alta un laboratorio antes de consultar su horario."
      redirect_to :action => :index
    end
  end

end
