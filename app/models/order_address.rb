class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/, message: "Input correctly"}
    validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: "Input only number"}, length: { maximum: 11}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end