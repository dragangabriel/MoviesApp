class AddReviewColumnInComments < ActiveRecord::Migration[5.0]
  def change  	
    add_column :comments, :vote, :integer
  end
end
