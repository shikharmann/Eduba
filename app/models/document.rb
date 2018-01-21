class Document < ApplicationRecord
	# Associations
	belongs_to :subtopic
	has_one :topic, through: :subtopic
	has_one :course, through: :subtopic
	# Validations
	validates_presence_of :name
    validates_presence_of :subtopic

  def cloud_name
    Digest::SHA256.hexdigest("#{self.id}")
  end

  def full_cloud_url
    AwsServices::DocumentStorage.new(self).public_url
  end

end
