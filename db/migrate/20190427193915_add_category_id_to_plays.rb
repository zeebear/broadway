class AddCategoryIdToPlays < ActiveRecord::Migration[5.2]
  def change
    add_reference :plays, :category_id, foreign_key: true
  end
end
