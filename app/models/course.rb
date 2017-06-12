class Course < ApplicationRecord
	# Associations
	has_many :topics
	belongs_to :department
	has_many :subtopics, through: :topics
	has_many :documents, through: :topics
end
