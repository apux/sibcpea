class CreateProfesores < ActiveRecord::Migration
  def self.up
    create_table :profesores do |t|
      t.string :numero_trabajador
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :categoria
      t.string :grado_academico
      t.string :linea_investigacion_actual
      t.string :categoria
      t.string :seguro_social
      t.string :curriculum_file_name
      t.string :curriculum_content_type
      t.integer :curriculum_file_size
      t.datetime :curriculum_updated_at
      t.string :resguardo_file_name
      t.string :resguardo_content_type
      t.integer :resguardo_file_size
      t.datetime :resguardo_updated_at


      t.timestamps
    end
  end

  def self.down
    drop_table :profesores
  end
end
