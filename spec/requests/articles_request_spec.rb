require 'rails_helper'

RSpec.describe "Articles", type: :request do

  describe "GET /rails" do
    it "returns http success" do
      get "/articles/rails"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /s" do
    it "returns http success" do
      get "/articles/s"
      expect(response).to have_http_status(:success)
    end
  end

end
