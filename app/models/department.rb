class Department < ApplicationRecord
	# Associations
	has_many :courses
	has_many :topics, through: :courses
	has_many :subtopics, through: :courses
	has_many :documents, through: :courses
end
