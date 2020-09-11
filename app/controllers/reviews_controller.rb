class ReviewsController < ApplicationController
    def create
        @cocktail = Cocktail.find(params[:cocktail_id])
        @review = Review.new(review_params)
        @review.cocktail = @cocktail
        @review.save 
    
        @doses = @cocktail.dose_ids.map do |id|
          Dose.find(id)
        end

        @reviews = Review.all
    
        if @review.save 
          redirect_to cocktail_path(@cocktail)
        else 
          render "cocktails/show"
        end
    end
    
    private

    def review_params 
      params.require(:review).permit(:name, :content)
    end
end
