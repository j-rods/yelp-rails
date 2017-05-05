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

  describe '#average_rating' do
    context 'no reviews' do
      it 'returns N/A when there are no reviews' do
        restaurant = Restaurant.create(name: 'The Ivy')
        expect(restaurant.average_rating).to eq 'N/A'
      end
    end

    context 'one review' do
      it 'returns that rating' do
        restaurant = Restaurant.create(name: 'The Ivy', user: User.new)
        restaurant.reviews.create(rating: 4, user: User.new)
        expect(restaurant.average_rating).to eq 4
      end
    end

    context 'multiple reviews' do
      it 'returns the average' do
        restaurant = Restaurant.create(name: 'The Ivy', user: User.new)
        restaurant.reviews.create(rating: 1, user: User.create(email: 'one@one.com', password: '123456', password_confirmation: '123456'))
        restaurant.reviews.create(rating: 5, user: User.create(email: 'fab@fab.com', password: '123456', password_confirmation: '123456'))
        expect(restaurant.average_rating).to eq 3
      end
    end
  end

end
