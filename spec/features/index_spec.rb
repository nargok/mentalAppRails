require 'spec_helper'

describe 'トップページにアクセスしたとき' do
  before do
    visit root_path
  end

  it 'トップページに遷移していること' do
    expect(page.current_path).to eq root_path
  end

end