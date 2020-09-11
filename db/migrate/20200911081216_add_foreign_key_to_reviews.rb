class AddForeignKeyToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :cocktail, null: false, foreign_key: true
  end
end
