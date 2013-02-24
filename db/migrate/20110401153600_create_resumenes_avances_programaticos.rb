class CreateResumenesAvancesProgramaticos < ActiveRecord::Migration
  def self.up
    create_table :resumenes_avances_programaticos do |t|
      t.references :avance_programatico
      t.string :porcentaje_programa_semestre1
      t.string :porcentaje_programa_semestre2
      t.string :porcentaje_programa_semestre3
      t.string :porcentaje_programa_semestre4
      t.string :porcentaje_programa_semestre_total
      t.string :porcentaje_unidad1
      t.string :porcentaje_unidad2
      t.string :porcentaje_unidad3
      t.string :porcentaje_unidad4
      t.string :porcentaje_unidad_total
      t.string :porcentaje_proyecto_semestre1
      t.string :porcentaje_proyecto_semestre2
      t.string :porcentaje_proyecto_semestre3
      t.string :porcentaje_proyecto_semestre4
      t.string :porcentaje_proyecto_semestre_total
      t.string :material_didactico_empleado
      t.string :material_didactico_generado

      t.timestamps
    end
  end

  def self.down
    drop_table :resumenes_avances_programaticos
  end
end
