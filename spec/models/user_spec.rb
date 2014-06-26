require 'rails_helper'

RSpec.describe User, :type => :model do
  before do
    @user = User.create!(name: "brian", password: "lalala", weight: 170)
  end

  specify {expect(@user).to be_valid}

  it {should validate_presence_of :name}

  it {should validate_presence_of :password}

  it {should validate_presence_of :weight}

  it {should validate_numericality_of :weight}

#Cannot create new user with an existing username
  it {should validate_uniqueness_of :name}

  it {should have_many(:drinks) }

  it {should have_many(:user_drinks)}


end
