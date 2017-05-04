def sign_up(email)
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: 'catcat'
  fill_in 'Password confirmation', with: 'catcat'
  click_button 'Sign up'
end