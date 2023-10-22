class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genres = Genre.all
    @genre = Gernre.new
  end

  def edit
    @genre = Genre.new(genre_params)
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
