class Ingredient < ApplicationRecord
    has_many :doses, dependent: :destroy
    has_many :cocktails, through: :doses

    validates :name, uniqueness: true, length: { minimum: 1 }
end
