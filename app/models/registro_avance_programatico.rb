class RegistroAvanceProgramatico < ActiveRecord::Base
  # Associations
  belongs_to :avance_programatico

  # Validations
  validates :unidad_tema, :length => {:maximum => 5}, :format => {:with => /^(\d+\.)*\d+$/}, :allow_blank => true
  validates :horas_impartidas, :length => {:maximum => 4}, :numericality => true, :allow_blank => true
  validates :nombre, :taxonomia, :objetivo, :modalidad_evaluacion, :length => {:maximum => 255}

  # Callbacks
  before_validation :limpia_campos_si_unidad_es_parcial

  #######################
  private
  #######################

  def limpia_campos_si_unidad_es_parcial
    posicion_primer_punto = self.unidad_tema.index('.')
    if posicion_primer_punto
      unidad_base = (self.unidad_tema[(posicion_primer_punto + 1)..-1].strip == "0")
      if !unidad_base
        self.taxonomia = nil
        self.objetivo = nil
        self.modalidad_evaluacion = nil
      end
    end
  end
end
