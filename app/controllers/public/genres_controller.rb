class Public::GenresController < ApplicationController
  def index
    @genre = Genre.find(params[:id])
    @genres = Genre.all
    @cake = Cake.find(params[:id])
  end
end
