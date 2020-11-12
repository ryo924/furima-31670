class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :day
  
  with_options presence: true do
    validates :name
    validates :text
    validates :price
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :day_id
  end

  validates :price, numericality: { greater_than: 300, less_than: 9999999 }

  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of :price, with: PRICE_REGEX, message: 'Half-width number'

end
