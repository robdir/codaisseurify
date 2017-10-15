class SongsController < ApplicationController

def index
  @artists = Artist.all
end

def show;
  @songs = Song.find(params[:id])
  @songs = @artist.songs
end

def new
  @song = Song.new
end

#Needed? This is all here, but the song must be then saved to the artists data.

# def create
#  @song = Song.new(song_params)
#     if @song.save
#       redirect_to artists_path(@artist)
#     else
#       render "new"
#     end
# end

def update
  @songs = Song.find(params[:id])

  if @song.update_attributes ( song_params )
    redirect_to artists_path
  else
    render 'edit'
  end
end

def song_params
  song_params = params.require(:song).permit(:name, :album)
end

end
