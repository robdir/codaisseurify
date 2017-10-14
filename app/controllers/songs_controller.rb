class SongsController < ApplicationController

def index
  @artists = Artist.all
end

def show;
end
