class AsistenciaGrupo < ActiveRecord::Base
  # Associations
  belongs_to :profesor_materia
  belongs_to :grupo
  belongs_to :aula
  has_many :asistencias, :dependent => :destroy

  accepts_nested_attributes_for :asistencias

  # Validations
  validates :profesor_materia_id, :grupo_id, :presence => true
end
