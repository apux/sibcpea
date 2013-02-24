class CreateSemestres < ActiveRecord::Migration
  def self.up
    create_table :semestres do |t|
      t.integer :numero
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :semestres
  end
end
