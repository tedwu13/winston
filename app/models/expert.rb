class Expert < User
  validates :phone_number, presence: true
  validates :guardian_email, presence: false
  validates :guardian_phone, presence: false

  validates :university, presence: true
end