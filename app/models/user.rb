class User < ActiveRecord::Base
  has_secure_password
  attr_accessor :password, :password_confirmation
  
  EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 } 
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password attr
  validates_length_of :password, :in => 8..20, :on => :create

  before_validation :encrypt_password
  after_save :clear_password

  def username=(value)
    self[:username] = value.downcase
  end

  def email=(value)
    self[:email] = value.downcase
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_digest = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def clear_password
    self.password = nil
  end
end
