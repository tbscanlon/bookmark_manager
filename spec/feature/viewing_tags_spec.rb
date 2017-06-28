require './app/models/link'

feature 'Viewing tags' do
  scenario 'Seeing all links with a particular tag' do
    add_link(title: "Bubble Website", url:"https://www.bubble.com", tag: "bubbles")
    add_link(title: "Facebook", url: "https://www.facebook.com", tag: "Social Media")
    visit('/tags/bubbles')
    expect(page).to have_content 'Bubble Website'
  end
end
