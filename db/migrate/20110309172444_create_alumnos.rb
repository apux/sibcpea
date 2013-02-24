class CreateAlumnos < ActiveRecord::Migration
  def self.up
    create_table :alumnos do |t|
      t.string :matricula
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :sexo
      t.string :telefono
      t.string :correo
      t.integer :porcentaje_beca
      t.string :otras_becas
      t.string :domicilio
      t.string :origen

      t.timestamps
    end
  end

  def self.down
    drop_table :alumnos
  end
end
