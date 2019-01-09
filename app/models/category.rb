class Category < ApplicationRecord
  has_many :encounters

  validates :name, presence: true, uniqueness: {case_sensitive: :false}

  scope :find_by_downcase, -> (cat_name) { where("lower(name) = ?", cat_name.downcase) }

end
