class CreateFeeds < ActiveRecord::Migration[5.0]
  def up
    create_table :feeds do |t|
      t.string :name
      t.string :url
      t.text :description

      t.timestamps
    end
  end
  def down
    drop_table :feeds
  end
end