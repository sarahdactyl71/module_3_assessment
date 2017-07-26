require 'rails_helper'

RSpec.describe "best buy api" do
  it "can search the surrounding area" do
    store = create(:store)
    visit root_path

    fill_in "Search", with: "80202"
    click_on "Search"

    expect(current_path).to eq(search_path)
    expect(page).to have_content("17 Total Stores")
    expect(page).to have_content(store.name)
    expect(page).to have_content(store.city)
    expect(page).to have_content(store.distance)
    expect(page).to have_content(store.phone)
    expect(page).to have_content(store.type)
  end
end

# 2. Consume Best Buy's API
#
# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 10 results (There are 17 stores within 25 miles. We want to display 10 on this page and 7 on the next. Get the first page to work first from start to finish and worry about pagination later.)
# And I should see the long name, city, distance, phone number and store type for each of the 10 results
