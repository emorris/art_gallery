class Show < ActiveRecord::Base
  belongs_to :gallery
  def to_s
    title
  end
end
