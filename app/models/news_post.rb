class NewsPost < ActiveRecord::Base
  scope :publish_ready, ->(){ where("publish_date < ?", Time.now) }
  def to_s
    title
  end
end
