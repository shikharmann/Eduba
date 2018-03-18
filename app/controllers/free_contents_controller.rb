class FreeContentsController < ApplicationController
  before_action :set_variables, only: :show

  def show
    raise ActionController::RoutingError.new('Not Found') if !@document.present?
  end

  private

  def set_variables
    @courses =  Course.joins(:topics => {:subtopics => :documents}).where(documents: {free_content: true})
    @document = Document.includes(subtopic: [topic: :course]).find_by(id: params[:id], free_content: true)
    return if !@document.present?
    topic = @document.subtopic.topic
    @subtopics = Subtopic.joins(:documents).where(documents: {free_content: true}, subtopics: {topic_id: topic.id})
  end

end
