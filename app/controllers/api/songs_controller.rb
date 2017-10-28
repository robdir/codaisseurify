class Api::SongsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    songs = Song.all
    render status: 200, json: songs
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.build(song_params)

     if @song.save
       render status: 200, json: @song
     else
       render status: 422, json: {
         errors: @song.errors
       }.to_json
     end
   end

   def destroy
     @artist = Artist.find(params[:artist_id])
     @song = Song.find(params[:id])
     @song.destroy

     render status: 200, json: {
       message: "Song deleted"
     }.to_json
   end

   def destroy_all
    @artist = Artist.find(params[:artist_id])
    @songs = artist.songs
    songs.destroy_all

    render status: 200, json: {
      message: "All songs deleted!"
    }.to_json
  end

   private

   def song_params
     song_params = params.require(:song).permit(:name, :album, :artist_id)
   end

   end
