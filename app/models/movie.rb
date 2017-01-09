class Movie < ApplicationRecord
	has_many :comments, dependent: :destroy	
    has_and_belongs_to_many :actors    
	mount_uploader :image1, ImageUploader
	mount_uploader :image2, ImageUploader
	mount_uploader :image3, ImageUploader
	validates :name, presence: true
	validates :releaseYear, presence: true
	validates :duration, presence: true
	validates :genres, presence: true
	validates :description, presence: true
	validates :trailerUrl, presence: true
end
