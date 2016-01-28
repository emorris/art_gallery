class CreateAppSettings < ActiveRecord::Migration
  def change
    create_table :app_settings do |t|
      t.integer  :singleton_guard
      t.text :about_text
      t.timestamps null: false
    end
  end
end
