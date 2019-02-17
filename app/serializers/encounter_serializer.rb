class EncounterSerializer < ActiveModel::Serializer
  attributes :id, :date, :time, :state, :county, :nearest_town, :conditions, :environment,
    :description, :witnesses
  belongs_to :user
  belongs_to :category
  has_many :tags
end
