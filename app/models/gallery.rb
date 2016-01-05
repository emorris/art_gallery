class Gallery < ActiveRecord::Base
  validates :name, presence: true
  has_many :shows
  has_many :pictures, :as => :imageable, dependent: :destroy
  accepts_nested_attributes_for :pictures, reject_if: :all_blank
  
  def to_s
    name
  end

  def shows_by_year
    shows.order(:end_date).group_by{ |u| u.created_at.year }.sort_by {|k,v| v}.reverse
  end
end
