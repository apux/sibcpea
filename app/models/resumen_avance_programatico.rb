class ResumenAvanceProgramatico < ActiveRecord::Base
  # Associations
  belongs_to :avance_programatico

  # Validations
  validates :porcentaje_proyecto_semestre1,
    :porcentaje_proyecto_semestre2,
    :porcentaje_proyecto_semestre3,
    :porcentaje_proyecto_semestre4,
    :porcentaje_proyecto_semestre_total,
    :porcentaje_programa_semestre1,
    :porcentaje_programa_semestre2,
    :porcentaje_programa_semestre3,
    :porcentaje_programa_semestre4,
    :porcentaje_programa_semestre_total,
    :porcentaje_unidad1,
    :porcentaje_unidad2,
    :porcentaje_unidad3,
    :porcentaje_unidad4,
    :porcentaje_unidad_total,
    :length => {:maximum => 3}
  validates :porcentaje_proyecto_semestre1,
    :material_didactico_empleado,
    :material_didactico_generado,
    :length => {:maximum => 255}
end
