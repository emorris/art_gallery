class Show < ActiveRecord::Base
  include Picturable
  belongs_to :gallery
  
  scope :visible, -> () { where('shows.visible = true') }

  def self.current
    time = Time.now
    where(
        "start_date <= ? AND end_date >= ?",
        time.end_of_day, time.beginning_of_day
    ).visible.first
  end

  def self.past(date)
    where("start_date < ?", date).visible
  end

  def self.future(date)
    where("end_date > ?", date).visible
  end

  def self.group_by_year
    order(start_date: :desc).group_by{ |u| u.end_date.year }.sort {|a,b| b <=> a}
  end
  
  def self.time_separation
    return_hash = {}
    current_show =  current
    return_hash[:current] = current_show
    time_splitter = current_show ? current_show : Show.new({ end_date: Time.now, start_date: Time.now})
    return_hash[:future] = future(time_splitter.end_date).group_by_year
    return_hash[:past] = past(time_splitter.start_date).group_by_year
    return_hash
  end

  def to_s
    title
  end
  
end
