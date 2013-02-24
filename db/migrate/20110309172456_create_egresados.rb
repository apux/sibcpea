class CreateEgresados < ActiveRecord::Migration
  def self.up
    create_table :egresados do |t|
      t.references :alumno
      t.references :generacion
      t.boolean :titulado
      t.string :metodo
      t.date :fecha

      t.timestamps
    end
  end

  def self.down
    drop_table :egresados
  end
end
