class Profesor < ActiveRecord::Base
  # Validations
  has_many :correos, :dependent => :destroy
  has_many :telefonos, :dependent => :destroy
  has_many :profesores_ciclos
  has_many :ciclos, :through => :profesores_ciclos
  has_many :profesores_materias, :through => :profesores_ciclos
  has_many :tutorias
  has_many :registro_tutorias, :through => :tutorias
  has_many :asesorias
  has_attached_file :curriculum
  has_attached_file :resguardo

  accepts_nested_attributes_for :correos, :allow_destroy => true, :reject_if => lambda { |a| a[:correo].blank? }
  accepts_nested_attributes_for :telefonos, :allow_destroy => true, :reject_if => lambda { |a| a[:telefono].blank? }

  # Validations
  validates :numero_trabajador, :nombre, :presence => true
  validates :numero_trabajador, :nombre, :apellido_paterno, :apellido_materno, 
    :seguro_social, :grado_academico, :linea_investigacion_actual, 
    :length => {:maximum => 255}, :allow_blank => true
  validates :numero_trabajador, :format => {:with => /^\d{1,5}$/}, :uniqueness => true
  validates :seguro_social, :format => {:with => /^\d{11}$/, :message => "debe ser de 11 dígitos"}, :uniqueness => true, :allow_blank => true
  validates :nombre, :apellido_paterno, :apellido_materno, 
    :format => {:with => /^[A-Za-zÁÉÍÓÚÑáéíóúñ ]*$/, :message => "sólo acepta letras"}
  validates :nombre, :length => {:maximum => 30}
  validates :apellido_paterno, :apellido_materno, :length => {:maximum => 20}
  validates :categoria, :length => {:maximum => 12}

  def nombre_completo
    "#{self.nombre} #{self.apellido_paterno} #{self.apellido_materno}"
  end
end
