class Visit < ApplicationRecord

  def self.record_visit!(user, shortened_url)
    Visit.create(user.id, shortened_url.id)
  end

  belongs_to :user
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :shorturl,
    primary_key: :id,
    foreign_key: :shorturl_id,
    class_name: :ShortenedUrl

end
