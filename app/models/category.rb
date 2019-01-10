class Category < ApplicationRecord
  has_many :encounters

  validates :name, presence: true, uniqueness: {case_sensitive: :false}

  include Slugify
  before_create :to_slug

  # scope :find_by_downcase, -> (cat_name) { where("lower(cat_name) = ?", cat_name.downcase) }
  # scope :ci_find, -> (cat_name) { where(Category.arel_table[:name].matches('cat_name')


end
