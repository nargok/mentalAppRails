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

end
