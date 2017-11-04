require 'spec_helper'

describe 'When creating a new user' do
  describe 'with valid credentials' do
    before  do
      visit new_user_registration_path
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'foobar'
      fill_in 'Password confirmation', with: 'foobar'
      click_button 'Sign up'
    end
    describe 'after saving the user' do
      let(:user) { User.find_by(email: 'user@example.com') }

      # アサーションを行う
      it '作成したユーザーが取得できている' do
        expect(user.email).to eq 'user@example.com'
      end

    end

  end

end