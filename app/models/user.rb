class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  enum role: { admin: "admin", writer: "writer" }
  before_validation :normalize_role

  # validations for User MOdel
  validates :role, presence: true, inclusion: { in: roles.keys }
  validates :name, presence: true, length: { maximum: 80 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :role, presence: true, inclusion: { in: [ "admin", "writer" ], message: "%{value} no es un rol válido" }

   # callbacks
   after_create :welcomeToWriteLove

   private
   def welcomeToWriteLove
    puts "wELCOME TO WRITELOVE #{self.name}, now you are part of our beautiful family"
   end
   def normalize_role
    self.role = role.to_s.downcase if role.present?
   end
end
