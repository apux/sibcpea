class CreateGeneraciones < ActiveRecord::Migration
  def self.up
    create_table :generaciones do |t|
      t.string :clave
      t.integer :ciclo1_id
      t.integer :ciclo2_id
      t.string :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :generaciones
  end
end
