class ProfesorMateria < ActiveRecord::Base
  # Vars
  HORAS = [
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00'
 ]

  # Associations
  belongs_to :profesor_ciclo
  belongs_to :materia
  belongs_to :grupo
  belongs_to :aula
  has_one :profesor, :through => :profesor_ciclo
  has_many :alumnos_ciclos, :through => :grupo

  # Validations
  validates :materia_id, :presence => true
  validates :hora1, :hora2, :hora3, :hora4, :hora5, :length => {:maximum => 30}
end
