class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :releaseYear
      t.integer :duration
      t.string :genres
      t.text :description
      t.string :trailerUrl

      t.timestamps
    end
  end
end
