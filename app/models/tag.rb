class Tag < ApplicationRecord
  has_many :taggings
  has_many :encounters, through: :taggings

  validates :name, presence: true, uniqueness: {case_sensitive: :false}
end
