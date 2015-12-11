class AddFileToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :image_file, :string
  end
end
