class DashboardController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def angular
     @galleries = Gallery.all
  end
end
