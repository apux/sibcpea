class Carrera < ActiveRecord::Base
  # Validations
  validates :clave, :nombre, :presence => true, :uniqueness => true
  validates :clave, :length => {:maximum => 2}
  validates :nombre, :length => {:maximum => 50}
  validates :descripcion, :length => {:maximum => 255}
end
