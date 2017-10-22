class SongsController < ApplicationController


def index
  @songs = Song.all
end

def show
  @songs = Song.all
  @song = Song.new
end

def create
  @artist = Artist.find(params[:artist_id])
   @song = @artist.songs.new(song_params)

  respond_to do |format|
    if @song.save
        format.html { redirect_to @artist, notice: "Song added to this artist!" }
        format.json { render :show, status: :created, location: @artist }
     else
       format.html { render artist_path }
       format.json { render json: @artist.errors, status: :unprocessable_entity }
     end
    end
   end

 def destroy
   @artist = Artist.find(params[:artist_id])
   @song = Song.find(params[:id])
   @song.destroy
   redirect_to @artist
 end

private

def song_params
  song_params = params.require(:song).permit(:name, :album, :artist_id)
end

end
