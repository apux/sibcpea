class CreateRegistrosAvancesProgramaticos < ActiveRecord::Migration
  def self.up
    create_table :registros_avances_programaticos do |t|
      t.references :avance_programatico
      t.string :unidad_tema
      t.string :nombre
      t.float :horas_impartidas
      t.string :taxonomia
      t.string :objetivo
      t.string :modalidad_evaluacion

      t.timestamps
    end
  end

  def self.down
    drop_table :registros_avances_programaticos
  end
end
