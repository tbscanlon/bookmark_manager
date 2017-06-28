feature "sign up" do
  scenario "filling out sign up form" do
    visit '/signup'
    fill_in(:email, with: "johnsmith@aol.com")
    fill_in(:password, with: "password123")
    click_button("Submit")

    users = User.all
    expect(page).to have_content("Welcome johnsmith@aol.com")
    expect(users.count).to eq 1
  end
end
