require 'rails_helper'

RSpec.describe Potepan::ProductsController, type: :controller do
  describe '#show' do
    let(:product) { create(:product) }

    before { get :show, params: { id: product.id } }

    it 'responds successfully' do
      expect(response).to be_successful
    end

    it 'renders show templete' do
      expect(response).to render_template :show
    end

    it '@productが期待される値を持つ' do
      expect(assigns(:product)).to eq product
    end
  end
end
