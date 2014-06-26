require 'rails_helper'

RSpec.describe Drink, :type => :model do

  it {should have_many(:users) }

  it {should have_many(:user_drinks)}

end
