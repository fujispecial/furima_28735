require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての情報が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上かつ英数字混合で登録できる" do
        @user.password = "aaaa11"
        @user.password_confirmation = "aaaa11"
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailは＠を含むこと" do
        @user.email = "testco.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在すると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordは5文字以下では登録できない" do
        @user.password = "aaaa1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは英字だけでは登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordは数字だけでは登録できない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "password_comfirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationが一緒でないと登録できない"do
        @user.password = "aaaa11"
        @user.password_confirmation = "bbbb11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "family_nameが半角だと登録できない" do
        @user.family_name = "ﾎｹﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name Full-width characters")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが半角だと登録できない" do
        @user.first_name = "ﾎｹﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it "family_name_rubyが空だと登録できない" do
        @user.family_name_ruby = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name ruby can't be blank")
      end
      it "family_name_rubyが半角カタカナだと登録できない" do
        @user.family_name_ruby = "ﾎｹﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name ruby Full-width katakana characters")
      end
      it "first_name_rubyが空だと登録できない" do
        @user.first_name_ruby = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby can't be blank")
      end
      it "first_name_rubyが半角カタカナだと登録できない" do
        @user.first_name_ruby = "ﾎｹﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby Full-width katakana characters")
      end
      it "birth_dateが空だと登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end