require 'rails_helper'

feature 'endorsing reviews' do
  before do
    kfc = Restaurant.create(name: 'KFC', user: User.new)
    kfc.reviews.create(thoughts: 'horrible', rating: 3)
  end

  scenario 'a user can endorse a review, which updates the endorsement count', js: true do
    visit restaurants_path
    click_link 'Endorse Review'
    expect(page).to have_content '1 endorsement'
  end
end
