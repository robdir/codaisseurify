class ArtistSerializer < ActiveModel::Serializer
  attributes :name, :id

  has_many :songs
end
