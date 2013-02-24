class CreateDocumentos < ActiveRecord::Migration
  def self.up
    create_table :documentos do |t|
      t.string :nombre
      t.string :documento_file_name
      t.string :documento_content_type
      t.integer :documento_file_size
      t.datetime :documento_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :documentos
  end
end
