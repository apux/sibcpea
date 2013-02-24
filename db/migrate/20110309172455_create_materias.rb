class CreateMaterias < ActiveRecord::Migration
  def self.up
    create_table :materias do |t|
      t.string :clave
      t.string :nombre
      t.integer :creditos
      t.string :tipo_asignatura
      t.string :programa_file_name
      t.string :programa_content_type
      t.integer :programa_file_size
      t.datetime :programa_updated_at
      t.references :semestre

      t.timestamps
    end
  end

  def self.down
    drop_table :materias
  end
end
