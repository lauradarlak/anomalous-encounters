class Encounter < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :tags, through: :encounters_tags
end

def flatten_date_array(date_hash)
  %w(1 2 3).map { |e| date_hash["date(#{e}i)"].to_i }
end
