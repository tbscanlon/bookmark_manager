require "./app/models/link.rb"

feature "saving links" do
  scenario "I can add a website and title to my bookmark manager" do
    add_link(url: "https://giphy.com", title: "sweet gifs", tags: "media")
    expect(page).to have_content("sweet gifs")
  end
end
