class TagsController < ApplicationController
  include SidebarBeforeActions

  def index
    @tags = Tag.all

  end

  def show
    @tag = Tag.find_by_name(params[:name].tr("-", " "))
    if @tag.nil?
      flash[:message] = "Tag does not exist"
      redirect_to root_path
    end
    @tags = Tag.all
  end

end
