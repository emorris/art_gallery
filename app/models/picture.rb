class Picture < ActiveRecord::Base
  SETTABLE_ATTRIBUTES = [:image_file, :text, :id, :sort]
  belongs_to :imagable, polymorphic: true
  mount_uploader :image_file, PictureUploader
  default_scope { order('sort asc') }

  def self.settable_attrs
    SETTABLE_ATTRIBUTES
  end
end
