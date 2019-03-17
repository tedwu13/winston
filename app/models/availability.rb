class Answer < ActiveRecord::Base
  belongs_to :user
  validates :available_at, presence: true
end
