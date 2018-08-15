class User < ApplicationRecord
  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 4, allow_nil: true }

  before_validation :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(username,password)
    user = User.find_by_username(username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end


  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  private

  def is_password?(pw)
    bcrypt = BCrypt::Password.new(self.password_digest)
    bcrypt.is_password?(pw)
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
