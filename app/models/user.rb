class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :university, presence: true, :if => :is_expert?
  validates :university, presence: false, :unless => :is_expert?
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  validates :phone_number, presence: true
  validates :time_zone, presence: true

  has_secure_password

  has_many :availabilities

  def is_expert?
    self.is_expert
  end

end
