class Review < ApplicationRecord
    belongs_to :cocktail

    validates :review_id, null: false
    validates :content, length: { minimum: 1 }
end