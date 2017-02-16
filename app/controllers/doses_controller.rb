class DosesController < ApplicationController

  before_action :find_cocktail, only: [:new, :create]
  before_action :find_dose, only: [:destroy]

  def new
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.new(dose_params)

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail = @dose.cocktail

    @dose.destroy
    redirect_to cocktail_path(@cocktail)

  end

  private

  def find_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
   params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
