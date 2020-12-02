require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


    it '全ての情報が存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname translation missing: ja.activerecord.errors.models.user.attributes.nickname.blank"
    end

    it 'emailが空では登録できないこと' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email translation missing: ja.activerecord.errors.models.user.attributes.email.blank"
    end

    it "emailに@が無いと登録できないこと" do
      @user.email = "kakakakakakkaai"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email translation missing: ja.activerecord.errors.models.user.attributes.email.invalid"
    end

    it "emailが重複していると登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email translation missing: ja.activerecord.errors.models.user.attributes.email.taken"
    end

    it "passwordが空だと登録できないこと" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password translation missing: ja.activerecord.errors.models.user.attributes.password.blank"
    end

    it "passwordが6文字以下だと登録できない" do
      @user.password = "1111k"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password translation missing: ja.activerecord.errors.models.user.attributes.password.too_short"
    end

    it "passwordとpassword_confirmationが不一致では登録できない" do
      @user.password = '111111k'
      @user.password_confirmation = '111111kk'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation translation missing: ja.activerecord.errors.models.user.attributes.password_confirmation.confirmation"
    end

end
