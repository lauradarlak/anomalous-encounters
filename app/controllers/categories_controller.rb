class CategoriesController < ApplicationController
  before_action :top_tags, 
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(slug: params[:slug])
  end

  private

  def top_tags
    @top_tags = Tag.top_tags
  end

  def related_t
    @tags = Category.find_by(slug: params[:slug]).related_tags

  end

end
