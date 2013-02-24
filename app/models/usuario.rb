class Usuario < ActiveRecord::Base
  # Associations
  belongs_to :permiso
  belongs_to :profesor

  # Validations
  validates :login, :uniqueness => true, :presence => true
  validates :password, :presence => true, :length => {:minimum => 6, :maximum => 12}
  validates_confirmation_of :password
  validates :profesor_id, :presence => true, :if => "permiso_id == 1 or permiso_id == 2"
  validates :profesor_id, :uniqueness => true, :if => "permiso_id == 1 or permiso_id == 2", :allow_blank => true
  validates :permiso_id, :uniqueness => true, :if => "permiso_id == 1", :allow_blank => true

  # Accessors
  attr_accessible :login, :password, :password_confirmation, :profesor_id
  attr_accessor :password

  # Callbacks
  before_save :encrypt_password


  # Methods

  def self.authenticate(login, password)
    usuario = find_by_login(login)
    usuario if usuario && usuario.password_hash == BCrypt::Engine.hash_secret(password, usuario.password_salt)
  end

  def permiso? p
    return unless self.permiso
    self.permiso.tipo_permiso == p.to_s
  end

  ################
  private
  ################

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
