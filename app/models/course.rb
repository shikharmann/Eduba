class Course < ApplicationRecord
	# Associations
	has_many :topics
	has_many :subtopics, through: :topics
	has_many :documents, through: :topics
	# Validations
	validates_presence_of :name
end
