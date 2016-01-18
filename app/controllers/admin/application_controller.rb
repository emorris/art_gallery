class Admin::ApplicationController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  def index
    
  end

  private
    def initial_picture_sort(obj)
      symbol = obj.model_name.param_key.to_sym
      sort = obj.pictures.last.nil? ? 0 : obj.pictures.last.sort + 1
      params[symbol][:pictures_attributes]['0'][:sort] = sort
    end
end
