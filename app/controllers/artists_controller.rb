class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @songs = @artist.songs
    @photos = @artist.photos
  end

#WIP

  def edit
    @artist = Artist.find(params[:id])
    @songs = @artist.songs
  end

  def update
    @artist = Artist.find(params[:id])
    @songs = @artist.songs

    if @artist.update_attributes ( artist_params )
      redirect_to @artist
    else
      render 'edit'
    end
  end

def artist_params
  params.require(:artist).permit(:songs)
end

end
