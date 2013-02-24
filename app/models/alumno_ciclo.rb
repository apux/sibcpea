class AlumnoCiclo < ActiveRecord::Base
  #Associations
  belongs_to :alumno
  belongs_to :ciclo
  belongs_to :grupo
  has_many :asistencias

  # Validations
  validates :alumno_id, :ciclo_id, :grupo_id, :presence => true
  validates :alumno_id, :uniqueness => {:scope => :ciclo_id, :message => "ya inscrito a este ciclo"}
end
