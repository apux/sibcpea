class RecursoLaboratorio < ActiveRecord::Base
  # Associations
  belongs_to :laboratorio
  has_many :calendario_recursos, :dependent => :destroy

  # Validations
  validates :nombre, :presence => true
  validates :nombre, :length => {:maximum => 50}
end
