class CalendarioRecurso < ActiveRecord::Base
  HORAS_INICIO = (0..23).collect{|e| "#{e}:00"}
  HORAS_FIN = (0..23).collect{|e| "#{e}:59"}
  # Associations
  belongs_to :recurso_laboratorio

  # Validations
  validates :recurso_laboratorio_id, :reservado_para, :fecha, :hora_inicio, :hora_fin, :presence => true
  validate :validates_fecha_posterior, :validates_rango_horas, :validates_hora_ocupada

  #####################
  private
  #####################

  def validates_fecha_posterior
    errors.add :fecha, 'debe ser posterior a la fecha actual' if fecha < Date.today
  end

  def validates_rango_horas
    errors.add :hora_inicio, 'debe ser anterior a la hora de fin' if hora_fin <= hora_inicio
  end

  def validates_hora_ocupada
    ni = CalendarioRecurso.where("hora_inicio >= ? and hora_inicio <= ? and fecha = ? and recurso_laboratorio_id = ?", 
                                 hora_inicio, hora_fin, fecha, recurso_laboratorio_id).count
    nf = CalendarioRecurso.where("hora_fin >= ? and hora_fin <= ? and fecha = ? and recurso_laboratorio_id = ?", 
                                 hora_inicio, hora_fin, fecha, recurso_laboratorio_id).count

    errors.add :hora_inicio, 'Este recurso ya está reservado dentro este rango de horas' if ni > 0
    errors.add :hora_fin, 'Este recurso ya está reservado dentro este rango de horas' if nf > 0
    return if ni > 0 or nf > 0

    ni = CalendarioRecurso.where("hora_inicio <= ? and hora_fin >= ? and fecha = ? and recurso_laboratorio_id = ?", 
                                 hora_inicio, hora_inicio, fecha, recurso_laboratorio_id).count
    nf = CalendarioRecurso.where("hora_inicio <= ? and hora_fin >= ? and fecha = ? and recurso_laboratorio_id = ?", 
                                 hora_fin, hora_fin, fecha, recurso_laboratorio_id).count
    errors.add :hora_inicio, 'Este recurso ya está reservado para esta hora' if ni > 0
    errors.add :hora_fin, 'Este recurso ya está reservado para esta hora' if nf > 0
  end
end
