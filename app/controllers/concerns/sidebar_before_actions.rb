module SidebarBeforeActions
  extend ActiveSupport::Concern

  included do
    before_action :set_categories, :top_tags
  end

private

def top_tags
  @top_tags = Tag.top_tags
end

def set_categories
  @categories = Category.all
end

end
