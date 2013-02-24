class Correo < ActiveRecord::Base
  # Associations
  belongs_to :profesor

  # Validations
  validates :correo, :presence => true
  validates :correo, :length => {:maximum => 30}
end
