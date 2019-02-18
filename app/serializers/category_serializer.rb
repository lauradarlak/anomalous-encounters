class CategorySerializer < ActiveModel::Serializer
  attributes :id, :slug, :name
  has_many :encounters
end
