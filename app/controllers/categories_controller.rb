class CategoriesController < ApplicationController
  include SidebarBeforeActions

  def index
    @categories = Category.all
    respond_to do |f|
      f.html {render :index}
      f.json {render json: @categories}
    end
  end

  def show
    @category = Category.find_by(slug: params[:slug])
  end

end
