class CreateNewsPosts < ActiveRecord::Migration
  def change
    create_table :news_posts do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.date :publish_date, null: false
      t.timestamps null: false
    end
  end
end
