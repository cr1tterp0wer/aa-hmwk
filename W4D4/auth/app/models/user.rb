require 'bcrypt'

class User < ApplicationRecord
  include SecureRandom

  #make sure User has a Session Token, then proceed
  before_validation :ensure_session_token
  after_validation :password
  validates :username, presence: true
  validates :session_token, presence: true
  validates :password_digest, presence: {message: "Password Cant be Blank!"},
            length:{minimum:10}, allow_nil: true


  #INSTANCE METHODS
  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def password
    self.password_digest =  BCrypt::Password.create(self.password_digest)
  end

  #STATIC/CLASS METHODS
  def self.find_by_credentials(creds)

  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  private
  def ensure_session_token
    self.session_token = User.generate_session_token
  end

end
