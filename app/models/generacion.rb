class Generacion < ActiveRecord::Base
  # Associations
  belongs_to :ciclo1, :class_name => "Ciclo"
  belongs_to :ciclo2, :class_name => "Ciclo"

  # Validations
  validates :clave, :ciclo1_id, :ciclo2_id, :presence => true
  validates :clave, :length => {:maximum => 30}
  validates :descripcion, :length => {:maximum => 255}
end
