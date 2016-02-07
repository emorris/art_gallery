class Artist < ActiveRecord::Base
  include Picturable
  def to_s
    name
  end
end
