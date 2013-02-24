class CreateCalendarioRecursos < ActiveRecord::Migration
  def self.up
    create_table :calendario_recursos do |t|
      t.references :recurso_laboratorio
      t.date :fecha
      t.time :hora_inicio
      t.time :hora_fin
      t.string :reservado_para
      t.references :usuario

      t.timestamps
    end
  end

  def self.down
    drop_table :calendario_recursos
  end
end
