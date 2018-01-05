class Session < ApplicationRecord
  validates :user_id, :session_token, presence: true
  validates :session_token, uniqueness: true
  after_initialize :ensure_session_token

  belongs_to :user

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  def ensure_session_token
      self.session_token ||= SecureRandom.urlsafe_base64
  end
end
