module SidebarHelper
  def top_tags
    @tags = Tag.all
  end
end
