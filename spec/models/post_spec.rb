require 'rails_helper'

RSpec.describe Post, type: :model do

  it 'is valid with title and content' do
    post = Post.new(
        title: 'test title',
        content: 'test content'
    )

    expect(post).to be_valid
  end

  it 'is invalid without title' do
    post = Post.new(
        content: 'test content'
    )

    expect(post).not_to be_valid
  end

  it 'is invalid without content' do
    post = Post.new(
        title: 'test title',
    )

    expect(post).not_to be_valid
  end

end
