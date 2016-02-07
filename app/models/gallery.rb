class Gallery < ActiveRecord::Base
  include Picturable
  validates :name, presence: true
  has_many :shows
  
  def to_s
    name
  end
end
