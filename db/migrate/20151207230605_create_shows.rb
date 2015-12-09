class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.belongs_to :gallery, index: true
      t.string :title, null: false
      t.text :artists
      t.date :start_date
      t.date :end_date
      t.boolean :visible
      t.datetime :reception_start
      t.datetime :reception_end
      t.text :text
      t.timestamps null: false
    end
  end
end
