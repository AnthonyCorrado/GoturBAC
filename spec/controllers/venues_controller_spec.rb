require 'rails_helper'

RSpec.describe VenuesController, :type => :controller do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => 1
      expect(response).to be_success
    end
  end

end
