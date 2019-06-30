class AnswersController < ApplicationController
  QUESTION_2_CHOICES = ['northeast', 'midwest', 'southeast', 'southwest', 'west', 'no_preference']

  # POST /answers
  def create
    puts params

    question_id = params[:question_id]
    if question_id.to_i == 2
      answer = []
      QUESTION_2_CHOICES.each do |choice|
        if params.key?(choice)
          answer.push(choice)
        end
      end
      answer = answer.join(',')
    else
      answer = params[question_id]
    end

    unless answer.empty?
      saved_answer = Answer.find_by(user_id: current_user.id, question_id: question_id)
      if saved_answer.present?
        saved_answer.update(answer_text: answer)
        saved_answer.save!
      else
        Answer.create(user_id: current_user.id, question_id: question_id, answer_text: answer)
      end
    end

    next_question_id = question_id.to_i + 1
    redirect_to "/survey/#{next_question_id}"
  end
end
