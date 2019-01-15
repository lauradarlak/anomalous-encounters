class Category < ApplicationRecord
  has_many :encounters

  validates :name, presence: true, uniqueness: {case_sensitive: :false}

  include Slugify
  before_create :to_slug

  scope :top_categories, -> { joins(:encounters).select('categories.*, count(category_id) as "category_count"').group(:category_id).order("category_count desc").limit(5) }

end
