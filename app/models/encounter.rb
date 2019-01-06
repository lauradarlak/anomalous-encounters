class Encounter < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :taggings, :dependent => :destroy
  has_many :tags, through: :taggings

  def self.tagged_with(name)
    Tag.find_by_name(params[:name]).encounters
  end

  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip.downcase).first_or_create!
    end
  end

  def self.tag_name
    Tags.map(&:name).map { |t| t }
  end

end



# def flatten_date_array(date_hash)
#   %w(1 2 3).map { |e| date_hash["date(#{e}i)"].to_i }
# end
