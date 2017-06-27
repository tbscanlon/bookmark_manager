require "./app/models/link.rb"

feature "saving links" do
  scenario "I can add a website and title to my bookmark manager" do
    visit('/links/add')
    fill_in(:url, with: "https://giphy.com/")
    fill_in(:title, with: "sweet gifs")
    click_button("add")
    expect(page).to have_content("sweet gifs")
  end
end
