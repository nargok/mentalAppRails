require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    context 'indexにアクセスしたとき' do

      it 'index templateがレンダリングされる' do
        get :index

        expect(response).to render_template :index
      end

    end
  end

  describe 'GET #show' do
    context 'showにアクセスしたとき' do
      before :each do
        @post = create(:post)
      end

      it 'assigns the requested posts to @post' do
        get :show, id: @post
        expect(assigns(:post)).to eq @post
      end


      it 'show templateが表示されること' do
        get :show, id: @post
        expect(response).to render_template :show
      end

    end
  end

  describe 'GET #new' do
    context 'newにアクセスしたとき' do


      it 'new templateが表示されること' do
        get :new
        expect(response).to render_template :new
      end

    end
  end

  describe 'Post #create' do
    context 'with valid attributes' do

      it 'saves the new post in the database' do
        expect {
          post :create, post: attributes_for(:post)
        }.to change(Post, :count).by(1)

      end

      # トップページへリダイレクトすること
      it 'redirects to root' do
        post :create, post: attributes_for(:post)
        expect(response).to redirect_to root_path
      end

    end

    context 'with invalid attributes' do

      it 'does not saves the new post in the database' do
        expect {
          post :create, post: attributes_for(:invalid_post)
        }.to change(Post, :count).by(0)
      end

      # new テンプレートを再表示すること
      it 're-renders the :new template' do
        post :create, post: attributes_for(:invalid_post)
        expect(response).to render_template :new
      end

    end
  end

  describe 'GET #edit' do
    context 'editにアクセスしたとき' do
      before :each do
        @post = create(:post)
      end

      it 'assigns the requested posts to @post' do
        get :show, id: @post
        expect(assigns(:post)).to eq @post
      end


      it 'edit templateが表示されること' do
        get :edit, id: @post
        expect(response).to render_template :edit
      end

    end
  end

  describe 'PATCH #update' do
    before :each do
      @post = create(:post)
    end

    context '有効な属性の場合' do

      it "changes @post's attributes" do
        patch :update, id: @post,
              post: attributes_for(:post,
              title: 'updated title',
              content: 'updated content')
        @post.reload
        expect(@post.title).to eq 'updated title'
        expect(@post.content).to eq 'updated content'
      end

      it 'redirects the updated post' do
        patch :update, id: @post, post: attributes_for(:post)
        expect(response).to redirect_to @post
      end

    end

    context '無効な属性の場合' do
      it "does not change @post's attributes" do
        original_title = @post.title
        patch :update, id: @post,
              post: attributes_for(:post,
              title: nil,
              content: 'put invalid title')
        @post.reload
        expect(@post.title).to eq original_title
        expect(@post.title).not_to eq 'put invalid title'
      end

      it 're-renders edit template' do
        patch :update, id: @post,
              post: attributes_for(:invalid_post)
        expect(response).to render_template(:edit)
      end

    end
  end
end
