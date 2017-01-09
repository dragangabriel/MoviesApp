class Actor < ApplicationRecord	
    has_and_belongs_to_many :movies
	mount_uploader :photo, ImageUploader
	 validates :name, presence: true
	 validates :description, presence: true
	 validates :dateOfBirth, presence: true
end
