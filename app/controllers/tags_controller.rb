class TagsController < ApplicationController
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
end
