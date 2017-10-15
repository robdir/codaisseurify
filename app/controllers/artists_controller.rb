class ArtistsController < ApplicationController

#Action for artist index

  def index
    @artists = Artist.all
  end

#Action for artists show page

  def show
    @artist = Artist.find(params[:id])
    @songs = @artist.songs
    @photos = @artist.photos
  end

#Action for deleting an artist and associated data

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to artists_path
  end
end
