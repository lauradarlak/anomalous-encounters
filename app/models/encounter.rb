class Encounter < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :tags, through: :encounters_tags
end
