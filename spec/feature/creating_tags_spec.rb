require "./app/models/link.rb"

feature "tagging links" do
  before(:each) do
    Tag.create(name: "Sport")
    Tag.create(name: "Shopping")
    add_link(url: "http://www.facebook.com", title: "Facebook", tag: "Social Media")
  end

  scenario "I can tag links in my bookmark manager" do
    link = Link.first
    expect(link.tags.map(&:name)).to include('Social Media')
  end

  scenario "Adding tags to existing links" do
    visit '/links/add_tag'
    fill_in(:website, with: "Facebook")
    fill_in(:add_tag, with: "Fake News")
    click_button("add")

    link = Link.first
    expect(link.tags.map(&:name)).to include('Social Media').and include('Fake News')
  end
end
