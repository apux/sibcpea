class Materia < ActiveRecord::Base
  # Association
  has_many :profesores_materias
  belongs_to :semestre
  has_attached_file :programa

  # Validations
  validates :clave, :semestre_id, :nombre, :presence => true
  validates :clave, :length => {:maximum => 7}, :format => {:with => /^\d+$/, :message => "sólo acepta dígitos"}
  validates :nombre, :length => {:maximum => 50}
  validates :tipo_asignatura, :length => {:maximum => 30}
  validates :creditos, :length => {:maximum => 2}
  validates :creditos, :numericality => {:only_integer => true, :message => "debe ser numérico"}, :allow_blank => true
end
