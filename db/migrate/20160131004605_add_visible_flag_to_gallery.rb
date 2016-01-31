class AddVisibleFlagToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :visible, :boolean, default: true
  end
end
