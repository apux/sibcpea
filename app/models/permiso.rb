class Permiso < ActiveRecord::Base
  # Validations
  validates :tipo_permiso, :descripcion, :presence => true
  validates :tipo_permiso, :descripcion, :format => {:with => /^[A-Za-z_ ]*$/}, :length => {:maximum => 30}
end
