require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  it "name,text,category_id,condition_id,shipping_fee_id,prefecture_id,day_id,price,imageが存在すること" do
    expect(@item).to be_valid
  end

  it "nameが必須であること" do
    @item.name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end

  it "textが必須であること" do
    @item.text = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Text can't be blank")
  end

  it "category_idが必須であること" do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Category must be other than 1")
  end

  it "condition_idが必須であること" do
    @item.condition_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition must be other than 1")
  end

  it "shipping_fee_idが必須であること" do
    @item.shipping_fee_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
  end

  it "prefecture_idが必須であること" do
    @item.prefecture_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it "day_idが必須であること" do
    @item.day_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Day must be other than 1")
  end

  it "priceが必須であること" do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it "imageが必須であること" do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end

  it "priceが¥300以上でなければならないこと" do
    @item.price = 100
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than 300")
  end

  it "priceが¥9999999以下でなければならないこと" do
    @item.price = 10000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than 9999999")
  end

  it "priceが半角数字でなければならないこと" do
    @item.price = "１００"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
  end

end
