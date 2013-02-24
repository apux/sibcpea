class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :login
      t.string :password_hash
      t.string :password_salt
      t.references :permiso
      t.references :profesor

      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
