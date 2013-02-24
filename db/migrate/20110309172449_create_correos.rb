class CreateCorreos < ActiveRecord::Migration
  def self.up
    create_table :correos do |t|
      t.references :profesor
      t.string :correo
      t.string :tipo

      t.timestamps
    end
  end

  def self.down
    drop_table :correos
  end
end
