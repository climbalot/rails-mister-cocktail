class Cocktail < ApplicationRecord
    has_many :doses, dependent: :destroy
    has_many :ingredients, through: :doses
    has_one_attached :photo, dependent: :destroy

    validates :name, uniqueness: true, length: { minimum: 1 }

    def self.search(search)
        if search 
            cocktail = Cocktail.find_by(name: search)
            if cocktail 
                self.where(cocktail_id: cocktail)
            else 
                @cocktails = Cocktail.all 
            end 
        else 
            @cocktails = Cocktail.all 
        end
    end
end
