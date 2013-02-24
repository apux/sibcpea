class Aula < ActiveRecord::Base
  # Validations
  validates :nombre, :presence => true
  validates :nombre, :length => {:maximum => 50}
  validates :descripcion, :length => {:maximum => 255}
end
