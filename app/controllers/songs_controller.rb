class SongsController < ApplicationController


def index
  @songs = Song.all
end

def new
  @song = Song.new
end

def show
  @songs = Song.all
  @song = Song.new
end

def create
  @artist = Artist.find(params[:artist_id])
   @song = @artist.songs.new(song_params)

  if @song.save
     redirect_to @artist, notice: "Song added to this artist!"
   else
     render :new
   end
 end

 def destroy
   @song = Song.find(params[:id])
   @song.destroy
   redirect_to artists_path
 end

private

def song_params
  song_params = params.require(:song).permit(:name, :album, :artist_id)
end

end
