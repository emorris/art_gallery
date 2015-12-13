class Artist < ActiveRecord::Base
  has_many :pictures, :as => :imageable, dependent: :destroy
  accepts_nested_attributes_for :pictures, reject_if: :all_blank
  def to_s
    name
  end
end
