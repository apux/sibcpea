class CreateProfesoresCiclos < ActiveRecord::Migration
  def self.up
    create_table :profesores_ciclos do |t|
      t.references :ciclo
      t.references :profesor
      t.string :horario1_lunes
      t.string :horario2_lunes
      t.string :horario1_martes
      t.string :horario2_martes
      t.string :horario2_miercoles
      t.string :horario1_miercoles
      t.string :horario2_jueves
      t.string :horario1_jueves
      t.string :horario2_viernes
      t.string :horario1_viernes

      t.timestamps
    end
  end

  def self.down
    drop_table :profesores_ciclos
  end
end
