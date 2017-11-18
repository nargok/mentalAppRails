require 'spec_helper'

feature '新規投稿にアクセスしたとき' do

  scenario 'add a new post' do
    @post = FactoryGirl.build(:post)
    visit new_post_path

    fill_in 'Title', with: @post.title
    fill_in 'Content', with: @post.content
    click_button '投稿する'

    expect(Post.find_by(title: @post.title)).to be_truthy
    expect(current_path).to eq root_path
  end

end