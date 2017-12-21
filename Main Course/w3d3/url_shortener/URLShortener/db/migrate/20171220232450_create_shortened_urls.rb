class CreateShortenedUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_urls do |t|
      t.string :shorturl, null: false
      t.string :longurl, null: false
      t.timestamps
    end
    add_index :shortened_urls, :shorturl, unique: true
    add_index :shortened_urls, :longurl, unique: true 
  end
end
