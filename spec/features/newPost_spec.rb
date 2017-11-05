require 'spec_helper'

feature '新規投稿にアクセスしたとき' do

  scenario 'add a new post' do
    @post = FactoryGirl.build(:post)
    visit posts_new_path

    expect {
      fill_in 'Title', with: @post.title
      fill_in 'Content', with: @post.content
      click_button '投稿する'
    }.to change(Post, :count).by(1)

    expect(current_path).to eq root_path
  end

end