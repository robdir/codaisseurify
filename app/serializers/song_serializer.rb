class SongSerializer < ActiveModel::Serializer
  attributes :name, :album, :id

  belongs_to :artist
end
