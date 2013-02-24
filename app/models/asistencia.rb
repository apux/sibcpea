class Asistencia < ActiveRecord::Base
  # Associations
  belongs_to :asistencia_grupo
  belongs_to :alumno_ciclo

  # Validations
  validates :asistencia_grupo_id, :alumno_ciclo, :presence => true
end
