require "rails_helper"

RSpec.describe Admin::ApplicationController do
  describe "PUT #change_locale" do
    let(:browser_locale) { "fr-CA" }
    let(:put!) { put :change_locale }

    context "with browser locale" do
      before do
        request.env["HTTP_ACCEPT_LANGUAGE"] = browser_locale
        put!
      end

      context "when fr" do
        let(:browser_locale) { "fr-CA" }

        it { expect(session[:locale]).to eq(:en) }
      end

      context "when en" do
        let(:browser_locale) { "en-US" }

        it { expect(session[:locale]).to eq(:fr) }
      end

      context "when blank" do
        it { expect(session[:locale]).to eq(I18n.default_locale == :en ? :fr : :en) }
      end
    end
  end
end
