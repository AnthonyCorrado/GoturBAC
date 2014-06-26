require 'rails_helper'

RSpec.describe DrinksController, :type => :controller do



  before do
    @user = User.create!(name: "brian", password: "lalala", weight: 170, id: 1)
  end



# tests begin failing from here down

  describe 'GET new' do
    before do
      get :new, :user_id => 1
    end

    it {should render_template :new}

    it {should respond_with(:success)}

  end



        describe "DELETE destroy" do
    before do
      @drink = @user.UserDrink.create
    end

        specify {expect do
          delete :destroy, id: @drink.id, :user_id => 1
        end.to change(@user.UserDrink, :count).by(-1)}

      it "should redirect to the index" do
        delete :destroy, id: @drink.id, :user_id => 1
        expect(response).to redirect_to user_path
      end
  end

end
