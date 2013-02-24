class CreateAsistenciaGrupos < ActiveRecord::Migration
  def self.up
    create_table :asistencia_grupos do |t|
      t.references :profesor_materia
      t.references :grupo
      t.date :fecha

      t.timestamps
    end
  end

  def self.down
    drop_table :asistencia_grupos
  end
end
