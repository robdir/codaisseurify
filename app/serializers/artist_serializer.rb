class ArtistSerializer < ActiveModel::Serializer
  attributes :name, :formed, :bio, :genre :id

  has_many :songs
end
