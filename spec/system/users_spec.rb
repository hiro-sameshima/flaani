require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
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
    end
  end
end
RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ログインができるとき' do 
    it '保存されているユーザーの情報と合致すればログインができる' do
      # トップページに移動する
      visit 'flaanis#index'
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('SIGN IN')
      # ログインページへ遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
        find('input[name="commit"]').click
      # トップページへ遷移する
      expect(current_path).to eq  "/users/sign_in"
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('SIGN IN')
      expect(page).to have_no_content('SIGN UP')
    end
  end
end

