require "./app/models/link.rb"

feature "tagging links" do
  scenario "I can tag links in my bookmark manager" do
    add_link(url: "http://www.facebook.com", title: "Facebook", tag: "Social Media")

    link = Link.first
    expect(link.tags.map(&:name)).to include('Social Media')
  end
end
