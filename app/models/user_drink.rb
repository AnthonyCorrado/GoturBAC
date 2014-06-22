class UserDrink < ActiveRecord::Base
  belongs_to :user
  belongs_to :drink

  accepts_nested_attributes_for :drink
end
