class SongSerializer < ActiveModel::Serializer
  attributes :id, :name, :album

  belongs_to :artist
end
