require 'rails_helper'
RSpec.describe Florist, type: :model do
  before do
    @florist = FactoryBot.build(:florist) # Floristのインスタンス生成
    @florist.avatar = fixture_file_upload('public/images/florist.jpeg')
  end

    describe 'フローリスト新規登録' do
      context '新規登録がうまくいくとき' do
      it "shop_name,email,passwordが存在すれば登録できる" do
        expect(@florist).to be_valid
      end
    end # end context(正常系)
    context '新規登録が上手く行かないとき' do
      it "nameが空だと登録できない" do
        @florist.name = ""
        @florist.valid?
        expect(@florist.errors.full_messages).to include("Name can't be blank")
      end
      it "emailが空では登録できない" do
        @florist.email = "" #emailの値を空にする
        @florist.valid?
        expect(@florist.errors.full_messages).to include("Email can't be blank")
      end
      it "avatarが空では登録できない" do
        @florist.avatar = nil #avatarの値を空にする
        @florist.valid?
        expect(@florist.errors.full_messages).to include("Avatar can't be blank")
      end
      it "emailに@が存在しない場合登録できない" do
        @florist.email = "aaa111"
        @florist.valid?
        expect(@florist.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @florist.password = ""
        @florist.valid?
        expect(@florist.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @florist.password = "aaa11"
        @florist.valid?
        expect(@florist.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @florist.password = '00000'
        @florist.password_confirmation = ''
        @florist.valid?
        expect(@florist.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードは半角英数字混合でないと登録できない' do
        @florist.password = 'ああカか１３'
        @florist.valid?
        expect(@florist.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end #end context(非正常)
  end # end describe
end # end Rspec
