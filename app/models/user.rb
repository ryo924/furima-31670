class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  SEI_MEI_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  SEI_MEI_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  validates :nickname, presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 6 }
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
  validates :sei, presence: true
  validates_format_of :sei, with: SEI_MEI_REGEX, message: 'Full-width characters'
  validates :mei, presence: true
  validates_format_of :mei, with: SEI_MEI_REGEX, message: 'Full-width characters'
  validates :sei_kana, presence: true
  validates_format_of :sei_kana, with: SEI_MEI_KANA_REGEX, message: 'Full-width katakana characters'
  validates :mei_kana, presence: true
  validates_format_of :mei_kana, with: SEI_MEI_KANA_REGEX, message: 'Full-width katakana characters'
  validates :birthday, presence: true
end
