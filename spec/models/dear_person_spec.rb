require 'rails_helper'
RSpec.describe DearPerson, type: :model do
  before do
    @dear_person = FactoryBot.build(:dear_person) # DearPersonのインスタンス生成
    @dear_person.image = fixture_file_upload('public/images/test_image.png')
  end
  describe 'dear_person' do
    context '新規登録がうまくいくとき' do
    it "全ての情報が正しく入力されれば登録出来る" do
      expect(@dear_person).to be_valid
    end
   end # context

    context '新規登録がうまくいかない時' do
    it "ニックネームが空だと登録できない" do
      @dear_person.nick_name = ""
      @dear_person.valid?
      expect(@dear_person.errors.full_messages).to include("Nick name can't be blank")
    end
    it "名字が空だと登録できない" do
      @dear_person.family_name = ""
      @dear_person.valid?
      expect(@dear_person.errors.full_messages).to include("Family name can't be blank")
    end
    it "名字が数字だと登録できない" do
      @dear_person.family_name = "11111"
      @dear_person.valid?
      expect(@dear_person.errors.full_messages).to include("Family name is invalid. Input full-width katakana characters.")
    end
    it "名字が記号だと登録できない" do
      @dear_person.family_name = "@:#$%{()}"
      @dear_person.valid?
      expect(@dear_person.errors.full_messages).to include("Family name is invalid. Input full-width katakana characters.")
    end
    it "名前が空だと登録できない" do
      @dear_person.last_name = ""
      @dear_person.valid?
      expect(@dear_person.errors.full_messages).to include("Last name is invalid. Input full-width katakana characters.")
    end
    it "名前が数字だと登録できない" do
      @dear_person.last_name = "12345"
      @dear_person.valid?
      expect(@dear_person.errors.full_messages).to include("Last name is invalid. Input full-width katakana characters.")
    end
    it "名前が記号だと登録できない" do
      @dear_person.last_name = "#$%&'()"
      @dear_person.valid?
      expect(@dear_person.errors.full_messages).to include("Last name is invalid. Input full-width katakana characters.")
    end
    it "名字（カナ）が空だと登録できない" do
      @dear_person.family_name_kana = ""
      @dear_person.valid?
      expect(@dear_person.errors.full_messages).to include("Family name kana is invalid. Input full-width katakana characters.")
    end
    it "名字（カナ）が数字だと登録できない" do
      @dear_person.family_name_kana = "12345"
      @dear_person.valid?
      expect(@dear_person.errors.full_messages).to include("Family name kana is invalid. Input full-width katakana characters.")
    end
    it "名字（カナ）が記号だと登録できない" do
      @dear_person.family_name_kana = "#$%&'()"
      @dear_person.valid?
      expect(@dear_person.errors.full_messages).to include("Family name kana is invalid. Input full-width katakana characters.")
    end
    it "名前（カナ）が空だと登録できない" do
      @dear_person.last_name_kana = ""
      @dear_person.valid?
      expect(@dear_person.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
    end
    it "名前（カナ）が数字だと登録できない" do
      @dear_person.last_name_kana = "12345"
      @dear_person.valid?
      expect(@dear_person.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
    end
    it "名前（カナ）が記号だと登録できない" do
      @dear_person.last_name_kana = "#$%&'()"
      @dear_person.valid?
      expect(@dear_person.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
    end
    it "誕生日が空だと登録できない" do
      @dear_person.birthday = "0"
      @dear_person.valid?
      expect(@dear_person.errors.full_messages).to include("Birthday can't be blank")
    end
    it "記念日が空だと登録できない" do
      @dear_person.anniversary = "0"
      @dear_person.valid?
      expect(@dear_person.errors.full_messages).to include("Anniversary can't be blank")
    end
   end # context
  end # describe
end # Rspec