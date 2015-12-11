class Show < ActiveRecord::Base
  belongs_to :gallery
  has_many :pictures, :as => :imageable, dependent: :destroy
  
  def to_s
    title
  end
end
