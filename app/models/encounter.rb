class Encounter < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :taggings, :dependent => :destroy
  has_many :tags, through: :taggings

  scope :recently_added_encounters, -> (limit) { order("created_at desc").limit(limit) }

  # def self.tagged_with(name)
  #   Tag.find_by_name(params[:name]).encounters
  # end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip.downcase).first_or_create!
    end
  end

end



# def flatten_date_array(date_hash)
#   %w(1 2 3).map { |e| date_hash["date(#{e}i)"].to_i }
# end
