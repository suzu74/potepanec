require 'rails_helper'

RSpec.describe Potepan::ProductsController, type: :controller do
  describe '商品詳細ページ(show action)' do
    let(:taxon) { create(:taxon) }
    let(:product) { create(:product, taxons: [taxon]) }
    let!(:related_products) { create_list(:product, 5, taxons: [taxon]) }

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

    it "関連商品が４つ表示されている" do
      expect(assigns(:related_products).size).to eq 4
    end
  end
end
