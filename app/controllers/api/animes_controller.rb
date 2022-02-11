class Api::AnimesController < ApplicationController
  before_action :set_platform
  before_action :set_anime, only: [:show, :update, :destroy]

  def index 
    render json: @platform.animes
  end

  def show
    render json: @anime
  end

  def create 
    @anime = @platform.animes.new(anime_params)
    if @anime.save
      render json: @anime
    else
      render json: { errors: @anime.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @anime.update(anime_params)
      render json: @anime
    else
      render json: { errors: @anime.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @anime.destroy
    render json: { message: "Anime deleted" }
  end

  private
    def anime_params
      params.require(:anime).permit(:title, :rating, :image)
    end

    def set_platform
      @platform = Platform.find(params[:platform_id])
    end

    def set_anime
      @anime = @platform.animes.find(params[:id])
    end
end