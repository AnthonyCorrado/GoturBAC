require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
    let :valid_attributes do
    {
      name: "brian",
      password: "lalala",
      weight: 170
    }
  end

   describe 'GET index' do
    before do
      get :index
    end

     xit {should render_template :index}

     xit {should respond_with(:success)}
  end

  describe 'GET new' do
    before do
      get :new
    end

    it {should render_template :new}

    it {should respond_with(:success)}

    specify {expect(assigns(:user)).to_not be_persisted}

  end

describe "POST create" do
    describe "successful create" do

        specify {expect do
          post :create, user: valid_attributes
        end.to change(User, :count).by(1)}


# Not entirely sure how to make a shoulda test in this case
      it "should redirect to the show page for user" do
        post :create, user: valid_attributes
        expect(response).to redirect_to user_path(current_user)
      end
    end

  end

 describe "GET show" do
    before do
        @user = User.create! valid_attributes
        get :show, id: @user.id
    end

    it {should render_template :show}

    it {should respond_with(:success)}

    specify {expect(assigns(:user)).to eq(@user)}


  end

   describe "GET edit" do
    before do
      @user = User.create! valid_attributes
      get :edit, id: @user.id
    end

    it {should render_template :edit}

    it {should respond_with(:success)}

    specify {expect(assigns(:user)).to eq(@user)}
  end

  describe "PUT update" do
    before do
      @user = User.create! valid_attributes
    end

# updating password won't be so simple
    describe "with successful update" do
      let :update_attributes do
        {
          name: "nairb",
          password: "lalala",
          weight: 071
        }
      end

        before do
          put :update, id: @user.id, user: update_attributes
        end

            specify {expect(@user.reload.name).to eq("nairb")}

            specify {expect(@user.reload.weight).to eq(071)}

            specify {expect(response).to redirect_to user_path}


      end
    end

        describe "DELETE destroy" do
    before do
      @user = User.create! valid_attributes
    end

        specify {expect do
          delete :destroy, id: @user.id
        end.to change(User, :count).by(-1)}

      it "should redirect to the index" do
        delete :destroy, id: @user.id
        expect(response).to redirect_to new_user_path
      end
  end

end
