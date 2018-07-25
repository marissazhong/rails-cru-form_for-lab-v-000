class ArtistsController < ApplicationController

	def show
		@artist = Artist.find(params[:id])
	end

	def new
		@artist = Artist.new
	end

	def create
	  @artist = Artist.new(genre_params(:name, :bio))
	  @artist.save
	  redirect_to genre_path(@artist)
	end

	def edit
		@artist = Artist.find(params[:id])
	end

	def update
	  @artist = Artist.find(params[:id])
		@artist.update(genre_params(:name, :bio))
    redirect_to genre_path(@artist)
	end

	def genre_params(*args)
		params.require(:genre).permit(*args)
	end
end
