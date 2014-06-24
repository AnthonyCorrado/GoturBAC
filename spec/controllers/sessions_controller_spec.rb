require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe 'GET new' do
    before do
      get :new
    end

    it {should render_template :new}

    it {should respond_with(:success)}

  end

  end
