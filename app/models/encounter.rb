class Encounter < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :taggings, :dependent => :destroy
  has_many :tags, through: :taggings

  before_create :set_user_index

  validates :category_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true

  scope :recently_added_encounters, -> (limit) { order("created_at desc").limit(limit) }
  default_scope { order("created_at desc") }

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip.downcase).first_or_create!
    end
  end

  def set_user_index
    self.user_index = self.user.encounters.count + 1
  end

end
