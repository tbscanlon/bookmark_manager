feature 'User sign up' do
  let(:email_address) { 'tom@test.com' }

  scenario 'successfully signs up' do
    sign_up
    expect(page).to have_content("Welcome #{email_address}")
    expect(User.count). to eq 1
  end

  scenario 'requires a matching password confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.to_not change(User, :count)
  end

  scenario "doesn't redirect on a bad password" do
    sign_up(password_confirmation: 'wrong')
    expect(page.current_path). to eq "/register"
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario "can't sign up without entering an email address" do
    expect { sign_up(email: nil) }.to_not change(User, :count)
    expect(page.current_path).to eq '/register'
    expect(page).to have_content "Email must not be blank"
  end

  scenario "can't sign up when entering a bad email address" do
    expect { sign_up(email: 'wrong') }.to_not change(User, :count)
  end

  scenario "can't sign up twice with the same email address" do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content "Email is already taken"
  end
end

feature 'User Sign in' do
  let(:email_address) { 'tom@test.com' }

  before do
    sign_up
  end

  scenario 'successfully signs in' do
    sign_in
    expect(page).to have_content "Welcome #{email_address}"
  end
end

feature 'User Sign out' do
  let(:email_address) { 'tom@test.com' }

  before do
    sign_in
    sign_up
  end

  scenario 'successfully signs out' do
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content("Welcome, #{email_address}")
  end
end
