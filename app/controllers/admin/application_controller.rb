class Admin::ApplicationController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  def index
    
  end

  private
    def get_initial_sort(obj)
      obj.pictures.last.nil? ?  0 : obj.pictures.last.sort + 1 
    end
end
