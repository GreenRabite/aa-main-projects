require 'securerandom'

class ShortenedUrl < ApplicationRecord
  validates :shorturl, :longurl, presence: true, uniqueness: true

  def self.random_code
    random_number = SecureRandom.urlsafe_base64
    if ShortenedUrl.exists?(random_number)
      random_number = SecureRandom.urlsafe_base64
    end
    random_number
  end

  def self.create_short_url(longurl, user_id)
    random_code = self.random_code
    ShortenedUrl.create(shorturl: random_code, longurl: longurl, user_id: user_id)
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visited_urls,
    primary_key: :id,
    foreign_key: :shorturl_id,
    class_name: :Visit

end
