require 'rails_helper'

RSpec.describe User, :type => :model do
  before do
    @user = User.create!(name: "brian", password: "lalala")
  end

    specify {expect(@user).to be_valid}

  it "is invalid without a name" do
    @user.name = nil
    expect(@user).to be_invalid
  end

  it "is invalid without a password" do
    @user.password = nil
    expect(@user).to be_invalid
  end

#Cannot create new user with an existing username
  it "should have a unique name" do
    repeat_name = User.new( name: "brian" )
    expect(repeat_name).to be_invalid
  end

  it "should have a has many relationship with drinks" do
    expect(@user).to have_many(:drinks)
  end


end
