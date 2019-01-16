class TagsController < ApplicationController
  before_action :top_tags, :set_categories
  def index
    @tags = Tag.all
    @categories = Category.all
  end

  def show
    @tag = Tag.find_by_name(params[:name].tr("-", " "))
    if @tag.nil?
      flash[:message] = "Tag does not exist"
      redirect_to root_path
    end
    @categories = Category.all
    @tags = Tag.all
  end

  private

  def set_categories
    @categories = Category.all
  end

  def top_tags
    @top_tags = Tag.top_tags
  end
end
