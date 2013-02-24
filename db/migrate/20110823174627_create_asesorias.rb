class CreateAsesorias < ActiveRecord::Migration
  def self.up
    create_table :asesorias do |t|
      t.date :fecha
      t.string :nombre
      t.string :codigo
      t.references :profesor
      t.string :tema

      t.timestamps
    end
  end

  def self.down
    drop_table :asesorias
  end
end
