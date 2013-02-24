class CreateProfesoresMaterias < ActiveRecord::Migration
  def self.up
    create_table :profesores_materias do |t|
      t.references :profesor_ciclo
      t.references :materia
      t.references :grupo
      t.string :hora1
      t.string :hora2
      t.string :hora3
      t.string :hora4
      t.string :hora5
      t.references :aula

      t.timestamps
    end
  end

  def self.down
    drop_table :profesores_materias
  end
end
