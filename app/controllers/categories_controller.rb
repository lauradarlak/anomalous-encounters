class CategoriesController < ApplicationController
  include SidebarBeforeActions

  def index

  end

  def show
    @category = Category.find_by(slug: params[:slug])
  end

end
