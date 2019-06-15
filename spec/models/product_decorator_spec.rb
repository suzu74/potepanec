require 'rails_helper'

RSpec.describe Spree::Product, type: :decorator do
  describe 'related_product' do

    let(:taxon1) { create(:taxon, name: "taxon1") }
    let(:taxon2) { create(:taxon, name: "taxon2") }
    let(:taxon3) { create(:taxon, name: "taxon3") }
    let(:product_with_taxon1) { create(:product, taxons: [taxon1]) }
    let(:product_with_taxon1_taxon2) { create(:product, taxons: [taxon1, taxon2]) }
    let(:product_with_taxon1_taxon3) { create(:product, taxons: [taxon1, taxon3]) }

    it '商品とカテゴリーが一致する' do
      expect(product_with_taxon1.related_products).
        to match_array([product_with_taxon1_taxon2, product_with_taxon1_taxon3])
    end
  end  
end
