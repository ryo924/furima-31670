require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname,email,password,password_confirmation,sei,mei,sei_kana,mei_kana,birthdayが存在すること" do
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "seiが空では登録できないこと" do
      @user.sei = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Sei can't be blank")
    end

    it "meiが空では登録できないこと" do
      @user.mei = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Mei can't be blank")
    end

    it "sei_kanaが空では登録できないこと" do
      @user.sei_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Sei kana can't be blank")
    end

    it "mei_kanaが空では登録できないこと" do
      @user.mei_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Mei kana can't be blank")
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "123ab"
      @user.password_confirmation = "123ab"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが半角英数字混合であれば登録できること" do
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      expect(@user).to be_valid
    end

    it "passwordが半角英数字混合でなければ登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "123abc"
      @user.password_confirmation = "1234abc"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "seiが全角（漢字・ひらがな・カタカナ）であれば登録できること" do
      @user.sei = "阿あア"
      expect(@user).to be_valid
    end

    it "seiが全角（漢字・ひらがな・カタカナ）でなければ登録できないこと" do
      @user.sei = "a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Sei Full-width characters")
    end

    it "meiが全角（漢字・ひらがな・カタカナ）であれば登録できること" do
      @user.mei = "阿あア"
      expect(@user).to be_valid
    end

    it "meiが全角（漢字・ひらがな・カタカナ）でなければ登録できないこと" do
      @user.mei = "a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Mei Full-width characters")
    end

    it "sei_kanaが全角（カタカナ）であれば登録できること" do
      @user.sei_kana = "ア"
      expect(@user).to be_valid
    end

    it "sei_kanaが全角（カタカナ）でなければ登録できないこと" do
      @user.sei_kana = "あ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Sei kana Full-width katakana characters")
    end

    it "mei_kanaが全角（カタカナ）であれば登録できること" do
      @user.mei_kana = "ア"
      expect(@user).to be_valid
    end

    it "mei_kanaが全角（カタカナ）でなければ登録できないこと" do
      @user.mei_kana = "あ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Mei kana Full-width katakana characters")
    end
  end
end