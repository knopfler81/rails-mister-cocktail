class CocktailsController < ApplicationController

  before_action :find_cocktail, only: [:show, :edit, :destroy ]

  def index
    @cocktails = Cocktail.all
    # if params[:query].present?
    #   @cocktail_search = Cocktail.where('cocktails.name LIKE ?', params[:query])


    # end
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktails_path
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :photo_cache)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
