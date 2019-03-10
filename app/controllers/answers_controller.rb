class AnswersController < ApplicationController
  # POST /answers
  def create
    questions_list = params[:questions_list].split(',')
    questions_list.each do |q_idx|
      answer = params[q_idx.to_s]
      unless answer.empty?
        saved_answer = Answer.find_by(user_id: current_user.id, question_id: q_idx)
        if saved_answer.present?
          saved_answer.update(answer_text: answer)
          saved_answer.save!
        else
          Answer.create(user_id: current_user.id, question_id: q_idx, answer_text: answer)
        end
      end
    end

    if params[:survey_completed] == 'true'
      current_user.update(survey_completed: true)
    else
      current_user.update(survey_completed: false)
    end

    head :ok, content_type: "text/html"
  end
end
