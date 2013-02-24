class Tutoria < ActiveRecord::Base
  # Associations
  belongs_to :profesor
  belongs_to :alumno
  has_many :registro_tutorias, :dependent => :destroy

  # Validations
  validates :profesor_id, :alumno_id, :presence => true
  validates :alumno_id, :uniqueness => true
end
