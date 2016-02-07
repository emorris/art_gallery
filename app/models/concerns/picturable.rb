module Picturable
  extend ActiveSupport::Concern
  included do
    has_many :pictures, :as => :imageable, dependent: :destroy
    before_create :initial_picture_sort
    accepts_nested_attributes_for :pictures, reject_if: :all_blank
  end
  
  def picture_save(params)
    params[:pictures_attributes]['0'][:sort] = initial_picture_sort
    update(params)
  end
  
  def initial_picture_sort
    self.pictures.last.nil? ? 0 : self.pictures.last.sort + 1
  end
end