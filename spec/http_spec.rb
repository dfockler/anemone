require 'spec_helper'

module Anemone
  describe HTTP do

    describe "fetch_page" do
      before(:each) do
        FakeWeb.clean_registry
      end

      it "should still return a Page if an exception occurs during the HTTP connection" do
        # HTTP.stub!(:refresh_connection).and_raise(StandardError)
        FakeWeb.register_uri(:get, SPEC_DOMAIN, :status => ["404", "Not Found"])
        http = Anemone::HTTP.new
        http.fetch_page(SPEC_DOMAIN).should be_an_instance_of(Page)
      end

    end
  end
end
