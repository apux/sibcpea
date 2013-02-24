class Laboratorio < ActiveRecord::Base
  # Associations
  has_many :recursos_laboratorio, :dependent => :destroy
  accepts_nested_attributes_for :recursos_laboratorio, :allow_destroy => true

  # Validations
  validates :nombre, :presence => true, :length => {:maximum => 50}
end
