class CategoriesController < ApplicationController
  before_action :top_tags, :top_categories

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

  def top_categories
    @top_categories = Category.top_categories
  end
end
