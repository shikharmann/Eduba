class DocumentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_variables, only: :show

  def show
  end

  private

  def set_variables
  	@courses = Course.includes(topics: [subtopics: :documents]).all
  	@document = Document.includes(subtopic: [topic: :course]).find(params[:id])
  	topic = @document.subtopic.topic
  	@subtopics = Subtopic.includes(:documents).where(topic_id: topic.id)
  end

end
