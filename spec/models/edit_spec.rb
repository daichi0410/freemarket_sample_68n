require 'rails_helper'

describe Edit do
  describe '#create' do

    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without an price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "is invalid without an item_text" do
      item = build(:item, item_text: "")
      item.valid?
      expect(item.errors[:item_text]).to include("can't be blank")
    end

    it "is invalid without an address" do
      item = build(:item, address: "")
      item.valid?
      expect(item.errors[:address]).to include("can't be blank")
    end

    it "is invalid without an date" do
      item = build(:item, date: "")
      item.valid?
      expect(item.errors[:date]).to include("can't be blank")
    end

    it "is invalid without an delivery_charge" do
      item = build(:item, delivery_charge: "")
      item.valid?
      expect(item.errors[:delivery_charge]).to include("can't be blank")
    end

    it "is invalid without an sold_out" do
      item = build(:item, sold_out: "")
      item.valid?
      expect(item.errors[:sold_out]).to include("can't be blank")
    end

    it "is invalid without an user_id" do
      item = build(:item, user_id: "")
      item.valid?
      expect(item.errors[:user_id]).to include("can't be blank")
    end

    it "is invalid without an category_id" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

  end
end
