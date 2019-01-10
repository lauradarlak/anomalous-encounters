module Slugify
  def to_slug
    self.slug = name.downcase.gsub(" ", "-")
  end
end
