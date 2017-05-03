require 'rails_helper'

describe Restaurant, type: :model do

  before do
    User.create(email: "user@name.com", password: 'password', password_confirmation: 'password')
  end

  it 'is not valid with a name of less than 3 characters' do
    user = User.first
    restaurant = user.restaurants.new(name: 'KF')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'is not valid unless it has a unique name' do
    user = User.first
    user.restaurants.create(name: 'Pizza Hut')
    restaurant = user.restaurants.new(name: 'Pizza Hut')
    expect(restaurant).to have(1).error_on(:name)
  end

end
