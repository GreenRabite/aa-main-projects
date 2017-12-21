class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.integer :user_id, null: false
      t.integer :shorturl_id, null: false
      t.timestamps
    end
    add_index :visits, :user_id
    add_index :visits, :shorturl_id
  end
end
