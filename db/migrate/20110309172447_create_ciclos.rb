class CreateCiclos < ActiveRecord::Migration
  def self.up
    create_table :ciclos do |t|
      t.string :clave
      t.string :tipo
      t.date :fecha_inicio
      t.date :fecha_fin
      t.string :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :ciclos
  end
end
