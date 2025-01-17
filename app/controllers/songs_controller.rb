class SongsController < ApplicationController
    
    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
        @genre = @song.genre
        @artist = @song.artist
    end

    def new
        @song = Song.new
        render :form
    end

    def create
        @song = Song.create(song_params(:name, :genre_id, :artist_id))
        redirect_to song_path(@song)
    end

    def edit 
        @song = Song.find(params[:id])
        render :form
    end

    def update
        @song = Song.update(song_params(:name, :genre_id, :artist_id))
        redirect_to song_path(@song)
    end

    private
    
    def song_params(*args)
        params.require(:song).permit(*args)
    end


end