class Comment < ApplicationRecord
  belongs_to :movie  
  belongs_to :user
  validates_uniqueness_of :user_id, :scope => [:movie_id]
  validates :body, 
          :presence => {:message => "Title can't be blank." }
end
