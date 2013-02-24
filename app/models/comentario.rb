class Comentario < ActiveRecord::Base
  # Associations
  belongs_to :aviso, :counter_cache => true
  belongs_to :usuario

  # Validations
  validates :comentario, :presence => true
  validates :comentario, :length => {:maximum => 255}
end
