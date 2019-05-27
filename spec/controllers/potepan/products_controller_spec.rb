require 'rails_helper'

RSpec.describe Potepan::ProductsController, type: :controller do
  describe '商品詳細ページ(show action)' do
    let(:product) { create(:product) }

    before { get :show, params: { id: product.id } }

    it 'レスポンスの成功' do
      expect(response).to be_successful
    end

    it 'show レンプレートが表示される' do
      expect(response).to render_template :show
    end

    it '@productが期待される値を持つ' do
      expect(assigns(:product)).to eq product
    end
  end
end
