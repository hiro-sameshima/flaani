require 'rails_helper'

RSpec.describe "DearPersons", type: :system do
  before do
    @user = FactoryBot.build(:user)
    @dear_person = FactoryBot.build(:dear_person)
  end
  context '大切な人(DearPerson)が登録できるとき' do
    it '正しい情報を入力すれば大切な人を登録出来る'do
      # トップページに移動する
      visit 'flaanis#index'
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('SIGN UP')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'Name', with: @user.name
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Password confirmation', with: @user.password_confirmation
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページへ遷移する
      expect(current_path).to eq root_path
      # カーソルを合わせるとログアウトボタンが表示されることを確認する
      expect(
        find(".global-nav").find("span").hover
      ).to have_content('ログアウト')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('SIGN UP')
      expect(page).to have_no_content('LOG IN')
      visit 'flaanis#index'
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('大切な人を登録する')
      # 投稿ページに移動する
      visit new_dear_person_path
      # フォームに情報を入力する
      attach_file 'dear_person[image]', image_path = Rails.root.join('public/images/test_image.png')
      fill_in 'ニックネーム', with: @dear_person.nick_name
      fill_in '例)田中', with: @dear_person.family_name
      fill_in '例)花子', with: @dear_person.last_name
      fill_in '例)タナカ', with: @dear_person.family_name_kana
      fill_in '例)ハナコ', with: @dear_person.last_name_kana
      select '1930',from: 'dear_person[birthday(1i)]'
      select '12',from: 'dear_person[birthday(2i)]'
      select '12',from: 'dear_person[birthday(3i)]'
      select '12',from: 'dear_person[anniversary(2i)]'
      select '12',from: 'dear_person[anniversary(3i)]'
      expect{
        find('input[name="commit"]').click
      }.to change { DearPerson.count }.by(1)
      save_and_open_page
    end
  end
end