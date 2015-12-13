class Picture < ActiveRecord::Base
  belongs_to :imagable, polymorphic: true
  mount_uploader :image_file, PictureUploader
  default_scope { order('sort asc') }
end
