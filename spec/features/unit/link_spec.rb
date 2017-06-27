require "./app/models/link.rb"

feature "viewing bookmarked links" do
  scenario "I can see a list of links on the homepage" do
    @link = Link.create(url: "http://www.google.com", title: "Google" )
    visit('/links')
    expect(page).to have_content("Google")
  end
end
