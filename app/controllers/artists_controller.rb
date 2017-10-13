class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @songs = @artist.songs
  end

end
