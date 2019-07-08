class SurveyController < ApplicationController
  before_action :authenticate_student!
  before_action :validate_question, only: :show
  before_action :load_question_and_answer, only: :show

  DEFAULT_QUESTIONS = [1, 2, 3, 4, 5].freeze

  private

  def validate_question
    @question_number = params[:id].to_i
    unless DEFAULT_QUESTIONS.include? @question_number
      head 404
    end
  end

  def load_question_and_answer
    question = Question.find(params[:id].to_i)
    @qna = {
      id: @question_number,
      question_text: question.question_text,
      answer: get_answer
    }
  end

  # question 2 has a strangely formatted answer due to its multiple choice nature
  def get_answer
    answer = Answer.where(question_id: @question_number, user: current_user).first
    if @question_number == 2
      answer.nil? ? Set.new : Set.new(answer&.answer_text&.split(','))
    else
      answer.nil? ? '' : answer.answer_text
    end
  end
end