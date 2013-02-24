class Documento < ActiveRecord::Base
  # Validations
  validates :nombre, :presence => true, :uniqueness => true
  has_attached_file :documento
  validates_attachment_presence :documento, :message => "debe ser ingresado"
end
