class ProfesorCiclo < ActiveRecord::Base
  # Associations
  belongs_to :ciclo
  belongs_to :profesor
  has_many :profesores_materias
  has_many :materias, :through => :profesores_materias

  accepts_nested_attributes_for :profesores_materias, :allow_destroy => true

  # Validations
  validates :ciclo_id, :profesor_id, :presence => true
  validates :horario1_lunes, :horario2_lunes, :horario1_martes, :horario2_martes, :horario2_miercoles,
    :horario1_miercoles, :horario2_jueves, :horario1_jueves, :horario2_viernes, :horario1_viernes, 
    :length => {:maximum => 30}
end
