class CreateRegistroTutorias < ActiveRecord::Migration
  def self.up
    create_table :registro_tutorias do |t|
      t.references :tutoria
      t.string :semestre
      t.date :fecha
      t.float :tiempo
      t.string :asunto
      t.string :compromiso

      t.timestamps
    end
  end

  def self.down
    drop_table :registro_tutorias
  end
end
