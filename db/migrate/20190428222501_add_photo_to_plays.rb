class AddPhotoToPlays < ActiveRecord::Migration[5.2]
  def change
    add_column :plays, :photo, :string
  end
end
