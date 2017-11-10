class Topic < ApplicationRecord
	# Associations
	has_many :subtopics
	belongs_to :course
	has_many :documents, through: :subtopics
	# Validations
	validates_presence_of :name
end
