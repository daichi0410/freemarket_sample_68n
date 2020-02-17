require 'rails_helper'

describe Address do
  describe '#create' do

    # 1. user_id以外がなければ登録できない。
    it "is valid with a family_name, last_name, j_family_name, j_last_name, postal_code, prefectures, municipality, number, details, phone_number" do
      address = build(:address)
      expect(address).to be_valid
    end

    # 2. family_nameが空では登録できないこと
    it "is invalid without an family_name" do
      address = build(:address, family_name: "")
      address.valid?
      expect(address.errors[:family_name]).to include("can't be blank")
    end

    # 3. last_nameが空では登録できないこと
    it "is invalid without a last_name" do
      address = build(:address, last_name: "")
      address.valid?
      expect(address.errors[:last_name]).to include("can't be blank")
    end

    # 4. j_family_nameが空では登録できないこと
    it "is invalid without an j_family_name" do
      address = build(:address, j_family_name: "")
      address.valid?
      expect(address.errors[:j_family_name]).to include("can't be blank")
    end


    # 5. j_last_nameが空では登録できないこと
    it "is invalid without an j_last_name" do
      address = build(:address, j_last_name: "")
      address.valid?
      expect(address.errors[:j_last_name]).to include("can't be blank")
    end

    # 6. postal_codeが空では登録できないこと
    it "is invalid without an postal_code" do
      address = build(:address, postal_code: "")
      address.valid?
      expect(address.errors[:postal_code]).to include("can't be blank")
    end

    # 7. municipalityが空では登録できないこと
    it "is invalid without a municipality" do
      address = build(:address, municipality: "")
      address.valid?
      expect(address.errors[:municipality]).to include("can't be blank")
    end

    # 8. numberが空では登録できないこと
    it "is invalid without an number" do
      address = build(:address, number: "")
      address.valid?
      expect(address.errors[:number]).to include("can't be blank")
    end


    # 9. phone_numberが空では登録できないこと
    it "is invalid without an phone_number" do
      address = build(:address, phone_number: "")
      address.valid?
      expect(address.errors[:phone_number]).to include("can't be blank")
    end


  end
end