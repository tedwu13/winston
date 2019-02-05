class QuestionsController < ApplicationController
  # GET /questions/1
  # GET /questions/1.json
  # GET /questions/1,2,3,4,5.json
  def show
    query_ids = params[:id].split(",")
    @questions = Question.where(id: query_ids)
  end
end
