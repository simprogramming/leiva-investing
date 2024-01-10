require "rails_helper"

RSpec.describe Admin::AdminController do
  describe "GET #admin" do
    before do
      get :admin, params: {}
    end

    it { expect(response).to be_successful }
  end
end
