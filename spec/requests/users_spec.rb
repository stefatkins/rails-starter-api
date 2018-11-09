require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }
  let(:valid_session) { auth_headers(user) }

  describe "GET /api/v1/users" do
    it "works! (now write some real specs)" do
      get api_v1_users_path, headers: valid_session
      expect(response).to have_http_status(200)
    end
  end
end
