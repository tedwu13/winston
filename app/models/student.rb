class Student < User
  validates :guardian_email, presence: true
  validates :university, presence: false
end