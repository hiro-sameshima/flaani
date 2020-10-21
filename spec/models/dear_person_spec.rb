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
    it "emailが空では登録できない" do
    end

   end # context
  end # describe
end # Rspec