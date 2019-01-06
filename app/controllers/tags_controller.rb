class TagsController < ApplicationController
  def index
  end

  def show
    @tag = Tag.find_by_name(params[:name].tr("-", " "))
  end
end
