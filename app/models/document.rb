class Document < ApplicationRecord
	# Associations
	belongs_to :subtopic
	has_one :topic, through: :subtopic
	has_one :course, through: :subtopic
	# Validations
	validates_presence_of :name
    validates_presence_of :subtopic

  after_create :generate_and_save_file_name

  def get_file_name
    generate_and_save_file_name if !file_name.present?
    file_name
  end

  def full_cloud_url
    AwsServices::DocumentStorage.new(self).public_url
  end

  private

  def generate_and_save_file_name
    self.update_attributes(file_name: generate_file_name)
  end

  def generate_file_name
    Digest::SHA256.hexdigest("#{self.id}")+'.html'
  end

end
