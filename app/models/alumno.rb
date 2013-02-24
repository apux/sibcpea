class Alumno < ActiveRecord::Base
  PORCENTAJES_BECA = [0, 25, 50, 75, 100]
  OTRAS_BECAS = ["NA", "PRONABES", "Alfredo Harp Helú", "Alimenticia", "Otra"]

  # Associations
  has_many :alumnos_ciclos
  has_many :ciclos, :through => :alumnos_ciclos
  has_many :grupos, :through => :alumnos_ciclos
  has_many :tutorias, :dependent => :destroy

  # Validations
  validates :matricula, :nombre, :sexo, :presence => true
  validates :nombre, :apellido_paterno, :apellido_materno, :format => { :with => /^[A-Za-zÁÉÍÓÚÑáéíóúñ ]*$/ }
  validates :nombre, :length => {:maximum => 30}
  validates :apellido_paterno, :apellido_materno, :length => {:maximum => 20}
  validates :porcentaje_beca, :inclusion => {:in => PORCENTAJES_BECA}
  validates :matricula, :nombre, :apellido_paterno, :apellido_materno, :correo, :telefono, :domicilio, :length => {:maximum => 255}
  validates :matricula, :uniqueness => true, :length => { :maximum  => 10 } 

  # Scopes
  scope :inscritos_ciclo_actual, joins(:alumnos_ciclos).where("alumnos_ciclos.ciclo_id" => Ciclo.actual)
  scope :inscritos_ciclo_actual_por_grupo, where("alumnos_ciclos.ciclo_id" => Ciclo.actual)
  #.group("alumnos.matricula, alumnos.nombre, alumnos.apellido_paterno, alumnos.apellido_materno, alumnos.porcentaje_beca, alumnos.correo, alumnos.telefono, alumnos.domicilio, alumnos.sexo, alumnos.origen, alumnos.created_at, alumnos.updated_at, alumnos.id")

  # Methods
  def nombre_completo symbol=nil
    if symbol.nil?
      "#{nombre} #{apellido_paterno} #{apellido_materno}"
    elsif symbol == :apellidos
      "#{apellido_paterno} #{apellido_materno} #{nombre}"
    end
  end
end
