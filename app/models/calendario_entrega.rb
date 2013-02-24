class CalendarioEntrega < ActiveRecord::Base
  # Associations
  has_many :fechas_entrega

  accepts_nested_attributes_for :fechas_entrega, :allow_destroy => true


  # Validations
  validates :nombre, :presence => true
end
