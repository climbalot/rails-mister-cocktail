class DosesController < ApplicationController
  def new
    @dose = Dose.new 
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
  end 

  def create 
    @dose = Dose.new()
  end 

  def destroy 
  end

  private 

  def dose_params 
    params.require(:dose).permit(:cocktail_id, :ingredient_id)
  end 
end
