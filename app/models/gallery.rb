class Gallery < ActiveRecord::Base
  validates :name, presence: true
  has_many :shows
  
  def to_s
    name
  end

end
