feature 'User sign up' do
  scenario 'successfully signs up' do
    sign_up
    expect(page).to have_content('Welcome joebloggs@bloggs.com')
    expect(User.count). to eq 1
  end

  scenario 'requires a matching password confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.to_not change(User, :count)
  end

  scenario "doesn't redirect on a bad password" do
    sign_up(password_confirmation: 'wrong')
    expect(page.current_path). to eq "/register"
    expect(page).to have_content('Password and password confirmation do not match')
  end
end
