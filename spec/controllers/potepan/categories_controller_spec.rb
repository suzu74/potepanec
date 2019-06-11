require 'rails_helper'

RSpec.describe Potepan::CategoriesController, type: :controller do
  describe "GET #show" do
    let(:taxon)         { create(:taxon, taxonomy: taxonomy) }
    let(:taxonomy)      { create(:taxonomy) }
    let(:product)       { create(:product, taxons: [taxon]) }
    let(:other_product) { create(:product) }

    before do
      get :show, params: { id: taxon.id }
    end

    it "レスポンスに成功" do
      expect(response).to be_successful
    end

    it "showテンプレートが表示されているか" do
      expect(response).to render_template :show
    end

    it "正しい@taxonが渡されているか" do
      expect(assigns(:taxon)).to eq(taxon)
    end

    it "正しい@taxonomyが渡されているか" do
      expect(assigns(:taxonomies)).to match_array(taxonomy)
    end

    it "正しい@productsが渡されているか" do
      expect(assigns(:products)).to match_array(product)
    end

    it "正しくない@productsが渡されていないか" do
      expect(assigns(:products)).not_to match_array(other_product)
    end
  end
end
