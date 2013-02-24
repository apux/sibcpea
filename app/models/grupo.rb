class Grupo < ActiveRecord::Base
  # Associations
  belongs_to :semestre
  has_many :alumnos_ciclos
  has_many :alumnos, :through => :alumnos_ciclos
  has_many :profesores_materias

  # Validations
  validates :semestre_id, :nombre, :presence => true
  validates :nombre, :length => {:maximum => 6}, :uniqueness => true, :allow_blank => true
  validates :descripcion, :length => {:maximum => 255}

  # Scopes
  scope :ultimo_semestre, joins(:semestre).where("semestres.numero" => '10')
end
