class User < ApplicationRecord
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: {error: "Password can't be blank"}
  validates :password, length: {minimum: 6, allow_nil: true}
  before_validation :ensure_session_token

end
