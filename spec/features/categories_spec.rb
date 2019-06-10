require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  let(:taxonomy) { create(:taxonomy) }
  let(:taxon) { create(:taxon, taxonomy: taxonomy, parent: taxonomy.root) }
  let!(:product) { create(:product, taxons: [taxon]) }

  background do
    # ユーザーがカテゴリー一覧のページを訪れる
    visit potepan_category_path(taxon.id)
  end

  scenario 'カテゴリーページに期待する情報が表示されている' do
    expect(page).to have_content taxon.name
    expect(page).to have_content taxonomy.name
    expect(page).to have_content "(#{taxon.all_products.count})"
  end

  scenario 'カテゴリーページに商品の情報が表示される' do
    expect(page).to have_content product.name
    expect(page).to have_content product.display_price
  end

  scenario 'カテゴリーページから商品詳細ページへ飛び、商品名が表示されている' do
    expect(page).to have_link product.name
    click_on product.name
    expect(current_path).to eq potepan_product_path(product.id)
    expect(page).to have_content product.name
  end
end
