class AvanceProgramatico < ActiveRecord::Base
  # Associations
  belongs_to :profesor_materia
  belongs_to :carrera
  has_many :registros_avances_programaticos, :dependent => :destroy
  has_one :resumen_avance_programatico, :dependent => :destroy

  accepts_nested_attributes_for :registros_avances_programaticos, :allow_destroy => true
  accepts_nested_attributes_for :resumen_avance_programatico, :allow_destroy => true

  # Validations
  validates :profesor_materia_id, :numero, :carrera_id, :fecha, :presence => true
  validates :numero, :length => {:maximum => 10}
  validates :periodo, :length => {:maximum => 50}
end
