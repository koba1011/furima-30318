class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/
  validates :email, uniqueness: true
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "Include both letters and numbers" }
  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: VALID_NAME_REGEX, message: "Full-width characters" }
    validates :first_name, format: { with: VALID_NAME_REGEX, message: "Full-width characters" }
    validates :last_name_kana, format: { with: VALID_NAME_KANA_REGEX, message: "Full-width katakana characters" }
    validates :first_name_kana, format: { with: VALID_NAME_KANA_REGEX, message: "Full-width katakana characters" }
    validates :birthday
  end  
end
