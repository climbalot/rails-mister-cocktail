class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, null: false, length: { minimum: 1 }
  validates :ingredient_id, uniqueness: { scope: :cocktail_id }
end
