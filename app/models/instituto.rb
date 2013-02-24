class Instituto < ActiveRecord::Base
  # Validations
  validates :nombre, :clave, :presence => true
  validates :nombre, :length => {:maximum => 50}
  validates :descripcion, :length => {:maximum => 255}
  validates :clave, :length => {:maximum => 10}, :uniqueness => true
end
