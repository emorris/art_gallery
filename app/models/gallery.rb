class Gallery < ActiveRecord::Base
  include Picturable
  validates :name, presence: true
  has_many :shows
  scope :visible, ->(){where(visible: true)}
  
  def self.get_first_image
    joins(:pictures).merge(Picture.where(sort: 0))
  end

  def to_s
    name
  end
end
