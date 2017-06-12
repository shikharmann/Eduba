class Subtopic < ApplicationRecord
	# Associations
	has_many :documents
	belongs_to :topic
	has_one :course, through: :topic
	has_one :department, through: :topic
	# Validations
	validates_presence_of :name
end
