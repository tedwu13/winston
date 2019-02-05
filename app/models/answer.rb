class Answer < ActiveRecord::Base
  belongs_to :user
  validates :question_id, presence: true
  validates :answer_text, presence: true
end
