require 'rails_helper'

RSpec.feature 'Products', type: :feature do
  let(:product) { create(:product) }

  scenario 'User accesses show page from root URL' do
    visit potepan_product_path(product.id)
    expect(page).to have_content product.name
    expect(page).to have_content product.display_price
    expect(page).to have_content product.description
  end
end
