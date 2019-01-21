class Category < ApplicationRecord
  has_many :encounters
  has_many :users, through: :encounters

  validates :name, presence: true, uniqueness: {case_sensitive: :false}

  include Slugify
  before_create :to_slug

end
