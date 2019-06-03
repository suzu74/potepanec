require 'rails_helper'

RSpec.feature 'Products', type: :feature do
  let(:product) { create(:product) }

  background do
    # ユーザーが商品詳細ページへ訪れる
    visit potepan_product_path(product.id)
  end
  scenario 'ユーザーが商品詳細ページへ訪れて、商品情報を見る' do
    expect(page).to have_content product.name
    expect(page).to have_content product.display_price
    expect(page).to have_content product.description
  end
end
