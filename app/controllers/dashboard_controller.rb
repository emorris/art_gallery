class DashboardController < ApplicationController
  def index
    @galleries = Gallery.all
  end
end
