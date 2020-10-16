require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user) # Userのインスタンス生成
  end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
      it "name,email,passwordが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nameは20文字以下では登録できる" do
        @user.name = "aaaaaaaaaaaaaaaaaaaa"
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'test456'
        @user.password_confirmation = 'test456'
        expect(@user).to be_valid
      end
    end # end context(正常系)

    context '新規登録が上手く行かないとき' do
      it "nameが空だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "nameが21文字以上であれば登録できない" do
        @user.name = "aaaaaaaaaaaaaaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include('Name is too long (maximum is 20 characters)')
      end
      it "emailが空では登録できない" do
        @user.email = "" #emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "emailに@が存在しない場合登録できない" do
        @user.email = "aaa111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aaa11"
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password = '00000'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードは半角英数字混合でないと登録できない' do
        @user.password = 'ああカか１３'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end #end context(非正常)
  end # end describe
end # end Rspec
