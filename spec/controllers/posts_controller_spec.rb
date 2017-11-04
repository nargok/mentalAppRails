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
end
