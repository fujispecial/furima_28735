class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i, message: "Include both letters and numbers" }
  with_options presence: true do
    validates :nickname
    validates :birth_date
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width characters" }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width characters" }
    validates :family_name_ruby, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" }
    validates :first_name_ruby, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" }
  end
end
