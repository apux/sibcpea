class CreateRecursosLaboratorio < ActiveRecord::Migration
  def self.up
    create_table :recursos_laboratorio do |t|
      t.references :laboratorio
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :recursos_laboratorio
  end
end
