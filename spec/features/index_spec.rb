require 'spec_helper'

describe 'トップページにアクセスしたとき' do
  before do
    visit root_path
  end

  it 'トップページに遷移していること' do
    expect(page.current_path).to eq root_path
  end

  it 'redirects to new page' do
    click_link 'add'
    expect(page.current_path).to eq new_post_path
  end

end