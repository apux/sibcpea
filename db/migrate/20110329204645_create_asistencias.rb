class CreateAsistencias < ActiveRecord::Migration
  def self.up
    create_table :asistencias do |t|
      t.references :asistencia_grupo
      t.references :alumno_ciclo
      t.boolean :presente
      t.string :observacion

      t.timestamps
    end
  end

  def self.down
    drop_table :asistencias
  end
end
