feature 'make a new user account' do
  scenario ' sign up form' do
    sign_up
    expect(page).to have_content('Welcome joebloggs@bloggs.com')
    expect(User.count). to eq 1
  end
end

feature 'User sign up' do
  scenario 'requires a matching password confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.to_not change(User, :count)
  end
end
