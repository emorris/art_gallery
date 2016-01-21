class NewsPost < ActiveRecord::Base
  scope :publish_ready, ->(){ where("publish_date < ?", Time.now) }
  scope :group_by_year, ->(){ group("DATE_TRUNC('year', publish_date)") }
  scope :by_year, ->(year){ where('extract(year from publish_date) = ?', year) }
  scope :select_for_links, ->(){ select([:id, :title, :publish_date])}
  
  def self.news_links_format
    links_by_year = {}
    counts_by_year ={}
    years_in_order = []

    publish_ready.group_by_year.count.each do |year, count| 
      year_str = year.strftime("%Y")
      years_in_order.push(year_str.to_i)
      links_by_year[year_str] = by_year(year_str).order(:publish_date).select_for_links.publish_ready
      counts_by_year[year_str] = count
    end
    
    return {
      years_in_order: years_in_order.sort! {|x,y| y <=> x } ,
      links_by_year: links_by_year ,
      counts_by_year: counts_by_year 
    }
  end

  def to_s
    title
  end

end
