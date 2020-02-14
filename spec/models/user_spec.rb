require 'rails_helper'

describe User do
  describe '#create' do

    # 1. nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること
    it "is valid with a nickname, email, password, password_confirmation, family_name, last_name, j_family_name, j_last_name, birthday_year, birthday_month, birthday_day" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # 3. emailが空では登録できないこと
    it "is invalid without an email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 4. passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 5. family_nameが空では登録できないこと
    it "is invalid without an family_name" do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    # 6. last_nameが空では登録できないこと
    it "is invalid without a last_name" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    # 7. j_family_nameが空では登録できないこと
    it "is invalid without an j_family_name" do
      user = build(:user, j_family_name: "")
      user.valid?
      expect(user.errors[:j_family_name]).to include("can't be blank")
    end


    # 8. j_last_nameが空では登録できないこと
    it "is invalid without an j_last_name" do
      user = build(:user, j_last_name: "")
      user.valid?
      expect(user.errors[:j_last_name]).to include("can't be blank")
    end

    # 9. birthday_yearが空では登録できないこと
    it "is invalid without a birthday_year" do
      user = build(:user, birthday_year: "")
      user.valid?
      expect(user.errors[:birthday_year]).to include("can't be blank")
    end

    # 9. birthday_monthが空では登録できないこと
    it "is invalid without an birthday_month" do
      user = build(:user, birthday_month: "")
      user.valid?
      expect(user.errors[:birthday_month]).to include("can't be blank")
    end

    # 10. birthday_dayが空では登録できないこと
    it "is invalid without an birthday_day" do
      user = build(:user, birthday_day: "")
      user.valid?
      expect(user.errors[:birthday_day]).to include("can't be blank")
    end

    # 11. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 12. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # 13. passwordが7文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

  end
end