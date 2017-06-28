def add_link(args)
  visit('/links/add')
  fill_in(:url, with: args[:url])
  fill_in(:title, with: args[:title])
  fill_in(:tag, with: args[:tag])
  click_button("add")
end
