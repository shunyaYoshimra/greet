require 'rails_helper'

describe 'プロフィール管理', type: :system do
  describe '一覧表示' do

    before do
      user = FactoryBot.create(:user,
         username: 'test-user',
         email: 'test@example.com',
          password: 'password'
        )
      FactoryBot.create(
        :profile,
         content: 'test-content',
         language: 'test-language',
         github: 'test-github.com',
         user_id: user.id
        )
    end

    context 'ユーザーがログインしている時' do
      before do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
      end

      it 'ユーザーのプロフィールが表示される。' do
        expect(page).to have_content 'test-content'
      end
    end

  end
end