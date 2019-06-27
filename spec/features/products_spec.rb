require 'rails_helper'

RSpec.feature 'Products', type: :feature do
  let(:taxon) { create(:taxon) }
  let(:product) { create(:product, taxons: [taxon]) }
  let!(:related_product) { create(:product, taxons: [taxon]) }

  background do
    # ユーザーが商品詳細ページへ訪れる
    visit potepan_product_path(product.id)
  end
  scenario 'ユーザーが商品詳細ページへ訪れて、商品情報を見る' do
    expect(page).to have_content product.name
    expect(page).to have_content product.display_price
    expect(page).to have_content product.description
  end

  scenario '関連商品一覧に商品詳細以外が表示されている' do
    within ".productsContent" do
      aggregate_failures do
        expect(page).to have_link related_product.name, href: potepan_product_path(related_product.id)
        expect(page).to have_content related_product.display_price
        expect(page).not_to have_content product.name
      end
    end
  end
end
