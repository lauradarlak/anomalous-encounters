class TagsController < ApplicationController
  include SidebarBeforeActions
  before_action :set_tags

  def index

  end

  def show
    @tag = Tag.find_by_name(params[:name].tr("-", " "))
    if @tag.nil?
      flash[:message] = "Tag does not exist"
      redirect_to root_path
    end
  end

  private

  def set_tags
    @tags = Tag.all
  end

end
