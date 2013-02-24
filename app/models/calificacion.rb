class Calificacion < ActiveRecord::Base
  MOTIVOS_CERO = ['Calificación obtenida', 'Sin derecho', 'No presentó', 'No solicitó']
  TIPOS_EXAMENES = ['Primer parcial', 'Segundo parcial', 'Tercer parcial', 'Ordinario', 'Primer extra', 'Segundo extra', 'Especial' ]

  # Associations
  belongs_to :profesor_materia
  belongs_to :alumno_ciclo
  has_one :materia, :through => :profesor_materia
  has_one :alumno, :through => :alumno_ciclo

  # Validations
  validates :profesor_materia_id, :alumno_ciclo_id, :presence => true
  validates :alumno_ciclo_id, :uniqueness => {:scope => :profesor_materia_id, :message => "ya tiene calificación de esta materia"}
  validates :parcial1, :parcial2, :parcial3, :ordinario, :extra1,
    :extra2, :especial, :promedio_parciales, :promedio, :final, 
    :numericality => {:greater_than_or_equal_to => 0.00, :less_than_or_equal_to => 10.00}, 
    :allow_blank => true
  validates :parcial1, :parcial2, :parcial3, :ordinario, :extra1,
    :extra2, :especial, 
    :format => {:with => /^[0-9]+(\.[0-9]{1}){0,1}$/, :message => "debe ser un número de un decimal como máximo"},
    :allow_blank => true

  validates :motivo_parcial1, :inclusion => {:in => MOTIVOS_CERO}, :if => "parcial1 == 0"
  validates :motivo_parcial2, :inclusion => {:in => MOTIVOS_CERO}, :if => "parcial2 == 0"
  validates :motivo_parcial3, :inclusion => {:in => MOTIVOS_CERO}, :if => "parcial3 == 0"
  validates :motivo_ordinario, :inclusion => {:in => MOTIVOS_CERO}, :if => "ordinario == 0"
  validates :motivo_extra1, :inclusion => {:in => MOTIVOS_CERO}, :if => "extra1 == 0"
  validates :motivo_extra2, :inclusion => {:in => MOTIVOS_CERO}, :if => "extra2 == 0"
  validates :motivo_especial, :inclusion => {:in => MOTIVOS_CERO}, :if => "especial == 0"

  # Callbacks
  before_validation :calcula_promedios

  # Scopes
  scope :del_ciclo_actual, joins(:alumno_ciclo).where("alumnos_ciclos.ciclo_id" => Ciclo.actual.id)


  def obtener_calificacion cual
   tipo = TIPOS_EXAMENES.index cual
   case tipo
   when 0:
     if parcial1
       if parcial1 > 0
         parcial1
       else
         motivo_parcial1 == "Calificación obtenida" ? parcial1 : motivo_parcial1
       end
     end
   when 1:
     if parcial2
       if parcial2 > 0
         parcial2
       else
         motivo_parcial2 == "Calificación obtenida" ? parcial2 : motivo_parcial2
       end
     end
   when 2:
     if parcial3
       if parcial3 > 0
         parcial3
       else
         motivo_parcial3 == "Calificación obtenida" ? parcial3 : motivo_parcial3
       end
     end
   when 3:
     if ordinario
       if ordinario > 0
         ordinario
       else
         motivo_ordinario == "Calificación obtenida" ? ordinario : motivo_ordinario
       end
     end
   when 4:
     if extra1
       if extra1 > 0
         extra1
       else
         motivo_extra1 == "Calificación obtenida" ? extra1 : motivo_extra1
       end
     end
   when 5:
     if extra2
       if extra2 > 0
         extra2
       else
         motivo_extra2 == "Calificación obtenida" ? extra2 : motivo_extra2
       end
     end
   when 6:
     if especial
       if especial > 0
         especial
       else
         motivo_especial == "Calificación obtenida" ? especial : motivo_especial
       end
     end
   end
  end

  #####################
  private
  #####################

  def calcula_promedios
    p1, p2, p3, o = 0, 0, 0, 0
    p1 = self.parcial1 if self.parcial1
    p2 = self.parcial2 if self.parcial2
    p3 = self.parcial3 if self.parcial3
    self.promedio_parciales = (p1 + p2 + p3) / 3
    self.promedio = (self.promedio_parciales + o) / 2
    self.final = ultima_calificacion_valida
  end

  def ultima_calificacion_valida
    return self.especial if self.especial and self.especial >= 0 and self.especial <= 10
    return self.extra2 if self.extra2 and self.extra2 >= 0 and self.extra2 <= 10
    return self.extra1 if self.extra1 and self.extra1 >= 0 and self.extra1 <= 10
    return self.promedio if self.promedio and self.promedio >= 0 and self.promedio <= 10
    return self.promedio_parciales if self.promedio_parciales and self.promedio_parciales >= 0 and self.promedio_parciales <= 10
    return self.parcial3 if self.parcial3 and self.parcial3 >= 0 and self.parcial3 <= 10
    return self.parcial2 if self.parcial2 and self.parcial2 >= 0 and self.parcial2 <= 10
    return self.parcial1 if self.parcial1 and self.parcial1 >= 0 and self.parcial1 <= 10
  end
end
