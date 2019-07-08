class AnswersController < ApplicationController
  before_action :authenticate_student!
  before_action :validate_question, only: :create

  DEFAULT_QUESTIONS = [1, 2, 3, 4, 5].freeze

  QUESTION_2_CHOICES = ['northeast', 'midwest', 'southeast', 'southwest', 'west', 'no_preference']

  # POST /answers
  def create
    answer = load_answer
    unless answer.empty?
      Answer
        .where(user_id: current_user.id, question_id: @question_id)
        .first_or_initialize
        .update!(answer_text: answer)
    end

    final_question? && mark_survey_completed!

    if final_question?
      redirect_to dashboard_index_path
    else
      redirect_to survey_path(next_question_id)
    end
  end

  private

  def load_answer
    if @question_id == 2
      answer = []
      QUESTION_2_CHOICES.each do |choice|
        if params.key?(choice)
          answer.push(choice)
        end
      end
      answer.join(',')
    else
      params[params[:question_id]]
    end
  end

  def validate_question
    @question_id = params[:question_id].to_i
    unless DEFAULT_QUESTIONS.include? @question_id
      head 404
    end
  end

  def final_question?
    @question_id == DEFAULT_QUESTIONS.last
  end

  def mark_survey_completed!
    current_user.survey_completed = true
    current_user.save!
  end

  def next_question_id
    @question_id + 1
  end
end
