class SurveyController < ApplicationController
  before_action :authenticate_user!

  DEFAULT_QUESTIONS = [1,2,3,4,5]

  def show
    question_number = params[:id].to_i
    unless DEFAULT_QUESTIONS.include? question_number
      head 404 and return
    end

    question = Question.find(question_number)
    @question_text = question.question_text
    answer = Answer.where(question_id: question_number, user: current_user).first
    @answer_text = answer.nil? ? '' : answer.answer_text
    if question_number == 2
      @answer_set = answer.nil? ? Set.new() : Set.new(answer.answer_text.split(','))
    end

    @green_rectangles_count = question_number
    @grey_rectangles_count = 5 - question_number

    if question_number == 5
      current_user.survey_completed = true
      current_user.save!
    end
  end
end