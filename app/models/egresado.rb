class Egresado < ActiveRecord::Base
  TIPO = ["CENEVAL", "TESIS", "OTRO"]

  # Associations
  belongs_to :alumno
  belongs_to :generacion

  # Validations
  validates :alumno_id, :generacion_id, :presence => true
  validates :alumno_id, :uniqueness => true
end
