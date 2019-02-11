class SurveysController < ApplicationController
  DEFAULT_QUESTIONS = [1,2,3,4,5]
  def index
    @questions_list = DEFAULT_QUESTIONS.join(",")
    @qna = []
    DEFAULT_QUESTIONS.each do |idx|
      question = Question.find(idx)
      question_text = question.nil? ? '' : question.question_text

      answer = Answer.where(question_id: idx, user: current_user).first
      answer_text = answer.nil? ? '' : answer.answer_text

      @qna << {
          question_id: idx,
          question: question_text,
          answer: answer_text
      }
    end

    render 'index'
  end
end