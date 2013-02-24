class Aviso < ActiveRecord::Base
  # Associations
  belongs_to :usuario
  has_many :comentarios

  # Validations
  validates :aviso, :usuario_id, :presence => true
  validates :aviso, :length => {:maximum => 255}
end
