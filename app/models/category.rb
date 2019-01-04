class Category < ApplicationRecord
  has_many :encounters

  validates :name, :presence: true, uniqueness: {case_sensitive: :false}
end
