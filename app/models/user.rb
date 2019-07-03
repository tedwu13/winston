class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email = email.downcase }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  validates :phone_number, presence: true, :if => :is_expert?

  validates :time_zone, presence: true

  validates :guardian_email, presence: true, :unless => :is_expert?
  validates :guardian_email, presence: false, :if => :is_expert?
  validates :guardian_phone, presence: false, :if => :is_expert?

  validates :university, presence: true, :if => :is_expert?
  validates :university, presence: false, :unless => :is_expert?

  has_many :availabilities

  def is_expert?
    self.is_expert
  end
end
