class Admin::GenresController < ApplicationController
before_action :authenticate_customer!

  def index
    @genres = current_customer.genres
    @genre = genre.new
  end

  def create
    @genre = genre.new(genre_params)
    @genre.customer_id = current_customer.id
    if @genre.save
      redirect_to genres_path
    else
      @genres = current_customer.genres
      render :index
    end
  end

  def destroy
    genre = genre.find(params[:id])
    genre.destroy
    redirect_to genres_path
  end

  def edit
    @genre = genre.find(params[:id])
  end

  def update
    @genre = genre.find(params[:id])
    if  @genre.update(genre_params)
      redirect_to genres_path
    else
      render :edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
