class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  SEI_MEI_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  SEI_MEI_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :nickname
    validates :sei
    validates :mei
    validates :sei_kana
    validates :mei_kana
    validates :birthday
  end

  validates :password, length: {minimum: 6 }
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
  validates_format_of :sei, with: SEI_MEI_REGEX, message: 'Full-width characters'
  validates_format_of :mei, with: SEI_MEI_REGEX, message: 'Full-width characters'
  validates_format_of :sei_kana, with: SEI_MEI_KANA_REGEX, message: 'Full-width katakana characters'
  validates_format_of :mei_kana, with: SEI_MEI_KANA_REGEX, message: 'Full-width katakana characters'
  
  has_many :items

end
