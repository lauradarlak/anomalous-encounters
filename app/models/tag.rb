class Tag < ApplicationRecord
  has_many :taggings
  has_many :encounters, through: :taggings

  validates :name, presence: true, uniqueness: {case_sensitive: :false}

  def to_param
    name.parameterize.join("_")
  end

  def self.find_by_param(input)
    find_by_name(input)
  end
end
