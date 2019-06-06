require 'rails_helper'

RSpec.describe Potepan::CategoriesController, type: :controller do
  describe "GET #show" do
    it "レスポンスに成功" do
      expect(response).to be_successful
    end
  end
end
