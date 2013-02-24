class CreateAvancesProgramaticos < ActiveRecord::Migration
  def self.up
    create_table :avances_programaticos do |t|
      t.string :numero
      t.references :profesor_materia
      t.references :carrera
      t.date :fecha
      t.string :periodo

      t.timestamps
    end
  end

  def self.down
    drop_table :avances_programaticos
  end
end
