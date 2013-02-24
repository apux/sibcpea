class CreateAlumnosCiclos < ActiveRecord::Migration
  def self.up
    create_table :alumnos_ciclos do |t|
      t.references :alumno
      t.references :ciclo
      t.references :grupo

      t.timestamps
    end
  end

  def self.down
    drop_table :alumnos_ciclos
  end
end
