class AddImageToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :image1, :string
    add_column :movies, :image2, :string
    add_column :movies, :image3, :string
  end
end
