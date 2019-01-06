class Encounter < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :taggings
  has_many :tags, through: :taggings

  def self.tagged_with(name)
    Tag.find_by!(name: name).posts
  end

  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end


end



# def flatten_date_array(date_hash)
#   %w(1 2 3).map { |e| date_hash["date(#{e}i)"].to_i }
# end
