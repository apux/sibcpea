class Ciclo < ActiveRecord::Base
  # Associations
  has_many :alumnos_ciclos
  has_many :alumnos, :through => :alumnos_ciclos

  # Validations
  validates :clave, :fecha_inicio, :fecha_fin, :presence => true
  validates :clave, :length => {:maximum => 12}
  validates :descripcion, :length => {:maximum => 255}
  validates :tipo, :length => {:maximum => 5}

  # Methods

  def self.actual
    Ciclo.order("clave ASC").last
  end
end
