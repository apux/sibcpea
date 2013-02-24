class Telefono < ActiveRecord::Base
  # Associations
  belongs_to :profesor

  # Validations
  validates :telefono, :profesor_id, :presence => true
  validates :telefono, :length => {:maximum => 30}
end
