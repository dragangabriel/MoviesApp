class CreateActors < ActiveRecord::Migration[5.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :photo
      t.string :description
      t.string :dateOfBirth

      t.timestamps
    end
  end
end
