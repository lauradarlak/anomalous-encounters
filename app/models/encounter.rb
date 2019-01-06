class Encounter < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :taggings
  has_many :tags, through: :taggings

  attr_accessor :all_tags

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(', ')
  end

end



# def flatten_date_array(date_hash)
#   %w(1 2 3).map { |e| date_hash["date(#{e}i)"].to_i }
# end
