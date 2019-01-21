class CategoriesController < ApplicationController
  include SidebarBeforeActions

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(slug: params[:slug])
  end

end
