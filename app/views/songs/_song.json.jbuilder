json.extract! song, :id, :name, :album
json.url artist_path(song, format: :json)
