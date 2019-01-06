class Tag < ApplicationRecord
  has_many :taggings, :dependent => :destroy
  has_many :encounters, through: :taggings

  validates :name, presence: true, uniqueness: {case_sensitive: :false}

  scope :tag_counts, -> { joins(:taggings).group(:tag_id).count }
  scope :please, -> {}

  def self.tag_counts_order
    Tag.tag_counts.map{|k,v| [Tag.find(k).name, v]}
  end

# {1=>2, 2=>2, 3=>1, 6=>1, 7=>1, 8=>1}

  def to_param
    name.parameterize.join("_")
  end

  def self.find_by_param(input)
    find_by_name(input)
  end
end
