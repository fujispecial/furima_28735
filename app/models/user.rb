class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :orders

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  VALID_NAMERUBY_REGEX = /\A[ァ-ヶー－]+\z/
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "Include both letters and numbers" }
  with_options presence: true do
    validates :nickname
    validates :birth_date
    validates :family_name, format: { with: VALID_NAME_REGEX, message: "Full-width characters" }
    validates :first_name, format: { with: VALID_NAME_REGEX, message: "Full-width characters" }
    validates :family_name_ruby, format: { with: VALID_NAMERUBY_REGEX, message: "Full-width katakana characters" }
    validates :first_name_ruby, format: { with: VALID_NAMERUBY_REGEX, message: "Full-width katakana characters" }
  end
end
