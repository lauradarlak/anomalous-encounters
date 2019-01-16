class CategoriesController < ApplicationController
  before_action :set_categories, :top_tags

  def show
    @category = Category.find_by(slug: params[:slug])
  end

  private

  def set_categories
    @categories = Category.all
  end

  def top_tags
    @top_tags = Tag.top_tags
  end
end
