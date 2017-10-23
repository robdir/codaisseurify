class Api::SongsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    songs = Song.all
    render status: 200, json: songs
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new(song_params)

     if @song.save
       render status: 200, json: @song
     else
       render status: 422, json: {
         errors: @song.errors
       }.to_json
     end
   end

   private

   def song_params
     song_params = params.require(:song).permit(:name, :album, :artist_id)
   end

   end
