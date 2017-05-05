def sign_up(email)
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: 'catcat'
  fill_in 'Password confirmation', with: 'catcat'
  click_button 'Sign up'
end

def leave_review(thoughts, rating)
  visit restaurants_path
  click_link 'Review KFC'
  fill_in 'Thoughts', with: thoughts
  select rating, from: 'Rating'
  click_button 'Leave Review'
end