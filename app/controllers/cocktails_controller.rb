class CocktailsController < ApplicationController
    def index
      @cocktails = Cocktail.search(params[:search])
    end 

    def show
      @cocktail = Cocktail.find(params[:id])
      @dose = Dose.new
      @doses = @cocktail.dose_ids.map do |id|
        Dose.find(id)
      end

      # Reviews
      @reviews = @cocktail.review_ids.map do |id|
        Review.find(id)
      end
      @review = Review.new
    end 

    def new
      @cocktail = Cocktail.new
    end 

    def create
      @cocktail = Cocktail.new(cocktail_params)
      @cocktail.save

      redirect_to cocktails_path
    end

    def search  
      if params[:search].blank?  
        redirect_to(root_path, alert: "Empty field!") and return  
      else  
        @parameter = params[:search].downcase  
        @results = Cocktail.all.where("lower(name) LIKE CONCAT('%',:search,'%')", search: @parameter)
      end 
    end

    private

    def cocktail_params 
      params.require(:cocktail).permit(:name, :search, :photo)
    end
end
