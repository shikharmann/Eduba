class Document < ApplicationRecord
	# Associations
	belongs_to :subtopic
	has_one :topic, through: :subtopic
	has_one :course, through: :subtopic
	has_one :department, through: :subtopic
	# Validations
	validates_presence_of :name
end
