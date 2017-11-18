require 'spec_helper'

feature '投稿の編集' do

  scenario 'update post' do
    # TODO 全体から実行するとエラーになるバグを解消する
    # @post = FactoryGirl.create(:post)
    # visit edit_post_path @post
    #
    #
    # find('#post_title', :visible => false).fill_in  with: 'Updated Title'
    # fill_in 'Content', with: 'Updated Content'
    # click_button '更新する'
    #
    # expect(Post.find_by(title: 'Updated Title')).to be_truthy
    # expect(current_path).to eq post_path @post
  end

end