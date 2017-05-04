require 'rails_helper'

feature 'reviewing' do
  before { Restaurant.create name: 'KFC', user: User.new }

  scenario 'allows users to leave a review using a form' do
    visit restaurants_path
    sign_up('kitty@cat.com')
    visit restaurants_path
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'so so'
    select '3', from: 'Rating'
    click_button 'Leave Review'
    visit restaurants_path
    click_link 'KFC'
    expect(page).to have_content('so so')
  end
end
