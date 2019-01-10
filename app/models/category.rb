class Category < ApplicationRecord
  has_many :encounters

  validates :name, presence: true, uniqueness: {case_sensitive: :false}

  scope :find_by_downcase, -> (cat_name) { where("lower(cat_name) = ?", cat_name.downcase) }
  scope :ci_find, -> { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }


end
