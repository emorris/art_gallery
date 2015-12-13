class AddSortToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :sort, :integer, default: 0
  end
end
