require "./app/models/link.rb"

feature "tagging links" do
  scenario "I can tag links in my bookmark manager" do
    visit('/links/add')
    fill_in(:url, with: "http://www.facebook.com")
    fill_in(:title, with: "facebook")
    fill_in(:tag, with: "social media")

    click_button("add")
    link = Link.first
    expect(link.tags.map(&:tag)).to include('social media')
  end
end
