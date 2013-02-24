class CreateTutorias < ActiveRecord::Migration
  def self.up
    create_table :tutorias do |t|
      t.references :profesor
      t.references :alumno

      t.timestamps
    end
  end

  def self.down
    drop_table :tutorias
  end
end
