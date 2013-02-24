class CreateCalendariosEntrega < ActiveRecord::Migration
  def self.up
    create_table :calendarios_entrega do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :calendarios_entrega
  end
end
