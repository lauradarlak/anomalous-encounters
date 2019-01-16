class Tag < ApplicationRecord
  has_many :taggings, :dependent => :destroy
  has_many :encounters, through: :taggings

  validates :name, presence: true, uniqueness: {case_sensitive: :false}

  scope :top_tags, -> { joins(:taggings).select('tags.*, count(tag_id) as "tag_count"').group(:tag_id).order("tag_count desc").limit(5) }

end
