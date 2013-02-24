class CreateInstitutos < ActiveRecord::Migration
  def self.up
    create_table :institutos do |t|
      t.string :clave
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :institutos
  end
end
