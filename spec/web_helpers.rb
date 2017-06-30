module WebHelpers
  def sign_up(email: 'tom@test.com',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/register'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Submit'
  end

  def sign_in(email: 'tom@test.com', password: '12345678')
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign In'
  end
end
