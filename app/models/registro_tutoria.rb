class RegistroTutoria < ActiveRecord::Base
  # Associations
  belongs_to :tutoria

  # Validations
  validates :tutoria_id, :fecha, :tiempo, :asunto, :presence => true
  validates :tiempo, :asunto, :compromiso, :length => {:maximum => 255}
  validates :tiempo, :numericality => true, :length => {:maximum => 3}

  # Callbacks
  before_validation :asignar_semestre

  ##############
  private
  ##############
  
  def asignar_semestre
    if self.tutoria && self.tutoria.alumno
      alumno_id = self.tutoria.alumno_id
      semestre = AlumnoCiclo.where(:ciclo_id => Ciclo.actual, :alumno_id => alumno_id).first.grupo.semestre
      self.semestre = semestre.nombre
    end
  end
end
