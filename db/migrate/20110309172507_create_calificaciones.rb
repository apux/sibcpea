class CreateCalificaciones < ActiveRecord::Migration
  def self.up
    create_table :calificaciones do |t|
      t.references :profesor_materia
      t.references :alumno_ciclo
      t.decimal :parcial1, :precision => 12, :scale => 2
      t.string :motivo_parcial1
      t.decimal :parcial2, :precision => 12, :scale => 2
      t.string :motivo_parcial2
      t.decimal :parcial3, :precision => 12, :scale => 2
      t.string :motivo_parcial3
      t.decimal :promedio_parciales, :precision => 12, :scale => 2
      t.decimal :ordinario, :precision => 12, :scale => 2
      t.decimal :promedio, :precision => 12, :scale => 2
      t.string :motivo_ordinario
      t.decimal :extra1, :precision => 12, :scale => 2
      t.string :motivo_extra1
      t.decimal :extra2, :precision => 12, :scale => 2
      t.string :motivo_extra2
      t.decimal :especial, :precision => 12, :scale => 2
      t.string :motivo_especial
      t.decimal :final, :precision => 12, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :calificaciones
  end
end
