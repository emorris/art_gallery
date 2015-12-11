class Artist < ActiveRecord::Base
  has_many :pictures, :as => :imageable, dependent: :destroy
  def to_s
    name
  end
end
