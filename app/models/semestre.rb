class Semestre < ActiveRecord::Base
  # Associations
  has_many :grupos

  # Validations
  validates :numero, :nombre, :presence => true
  validates :numero, :descripcion, :length => {:maximum => 255}
  validates :nombre, :length => {:maximum => 7}
  validates :numero, :numericality => {:greater_than => 0, :less_than_or_equal_to => 10}
end
