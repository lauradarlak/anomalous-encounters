class CategoriesController < ApplicationController
  include SidebarBeforeActions

  def show
    @category = Category.find_by(slug: params[:slug])
  end

end
