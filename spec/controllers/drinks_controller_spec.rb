require 'rails_helper'

RSpec.describe DrinksController, :type => :controller do
  let :valid_attributes do
    {
      drink_name: "Tecate",
      alcohol: 0.6
    }
  end

  before do
    @user = User.create!(name: "brian", password: "lalala", id: 1)
  end



# tests begin failing from here down

  describe 'GET new' do
    before do
      get :new, :user_id => 1
    end

    it {should render_template :new}

    it {should respond_with(:success)}

    specify {expect(assigns(:drink)).to_not be_persisted}

  end



        describe "DELETE destroy" do
    before do
      @drink = Drink.create! valid_attributes
    end

        specify {expect do
          delete :destroy, id: @drink.id, :user_id => 1
        end.to change(Drink, :count).by(-1)}

      it "should redirect to the index" do
        delete :destroy, id: @drink.id, :user_id => 1
        expect(response).to redirect_to user_path
      end
  end

end
