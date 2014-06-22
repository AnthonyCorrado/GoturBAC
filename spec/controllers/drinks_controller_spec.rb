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

  describe 'GET index' do
    before do
      get :index, :user_id => 1
    end

      it {should render_template :index}

      it {should respond_with(:success)}
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

describe "POST create" do
    describe "successful create" do

        specify {expect do
          post :create, drink: valid_attributes
        end.to change(Drink, :count).by(1)}


# Not entirely sure how to make a shoulda test in this case
      it "should redirect to the show page for drink" do
        post :create, drink: valid_attributes
        expect(response).to redirect_to drink_path(current_drink)
      end
    end

  end

   describe "GET edit" do
    before do
      @drink = Drink.create! valid_attributes
      get :edit, id: @drink.id, :user_id => 1
    end

    it {should render_template :edit}

    it {should respond_with(:success)}

    specify {expect(assigns(:drink)).to eq(@drink)}
  end

  describe "PUT update" do
    before do
      @drink = Drink.create! valid_attributes
    end

# updating password won't be so simple
    describe "with successful update" do
      let :update_attributes do
        {
          drink_name: "PBR",
          alcohol: 0.55
        }
      end

        before do
          put :update, id: @drink.id, drink: update_attributes
        end

            specify {expect(@drink.reload.drink_name).to eq("PBR")}

            specify {expect(@drink.reload.alcohol).to eq(0.55)}

            specify {expect(response).to redirect_to drink_path}


      end
    end

        describe "DELETE destroy" do
    before do
      @drink = Drink.create! valid_attributes
    end

        specify {expect do
          delete :destroy, id: @drink.id
        end.to change(Drink, :count).by(-1)}

      it "should redirect to the index" do
        delete :destroy, id: @drink.id
        expect(response).to redirect_to user_path
      end
  end

end
