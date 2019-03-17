class Availability < ActiveRecord::Base
  belongs_to :user
  validates :available_at, presence: true, uniqueness: { scope: :user_id }
end
