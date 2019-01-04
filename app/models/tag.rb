class Tag < ApplicationRecord
  has_many :encounters_tags
  has_many :encounters, through: :encounters_tags

  validates :name, presence: true, uniqueness: {case_sensitive: :false}
end
