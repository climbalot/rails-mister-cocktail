class AddReviewsColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :review, :text
  end
end
