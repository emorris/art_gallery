class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name, null: false
      t.text :text, null: false
      t.timestamps null: false
    end
  end
end
