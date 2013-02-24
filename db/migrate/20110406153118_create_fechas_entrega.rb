class CreateFechasEntrega < ActiveRecord::Migration
  def self.up
    create_table :fechas_entrega do |t|
      t.date :fecha
      t.string :descripcion
      t.references :calendario_entrega

      t.timestamps
    end
  end

  def self.down
    drop_table :fechas_entrega
  end
end
