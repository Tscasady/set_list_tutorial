class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
    render :index
  end

  def new
    render :new
  end

  def create
    # binding.pry;
    artist = Artist.create(artist_params)
    if artist.save 
      #happy path
      redirect_to "/artists"
    else
      @error_msg = "Missing required information"
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
    render :edit
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to '/artists'
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to '/artists'
  end

private
  def artist_params
    params.permit(:name)
  end
end
