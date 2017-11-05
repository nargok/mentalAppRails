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
end
