class CreateEntries < ActiveRecord::Migration[5.0]
  def up
    create_table :entries do |t|
      t.string :title
      t.datetime :published
      t.text :content
      t.string :url
      t.string :author
      t.integer :feed_id
      t.boolean :isposted, default: false, null: false

      t.timestamps
    end
  end
  def down
    drop_table :entries
  end
end