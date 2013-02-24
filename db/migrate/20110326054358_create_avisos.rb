class CreateAvisos < ActiveRecord::Migration
  def self.up
    create_table :avisos do |t|
      t.string :aviso
      t.references :usuario
      t.integer :comentarios_count, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :avisos
  end
end
