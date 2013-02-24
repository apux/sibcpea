class Asesoria < ActiveRecord::Base
  # Associations
  belongs_to :profesor

  # Validations
  validates :fecha, :nombre, :codigo, :profesor_id, :tema, :presence => true
  validates :nombre, :length => {:maximum => 100}
  validates :codigo, :length => {:maximum => 12}
end
