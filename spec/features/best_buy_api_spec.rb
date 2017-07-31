require 'rails_helper'

RSpec.describe "best buy api" do
  it "can search the surrounding area" do
    visit root_path

    fill_in "search", with: "80202"
    click_on "Search Stores"

    expect(current_path).to eq(search_path)
    expect(page).to have_content("17 Total Stores")
    expect(page).to have_content("Cherry Creek Shopping Center")
    expect(page).to have_content("Denver")
    expect(page).to have_content("3.45")
    expect(page).to have_content("303-270-9189")
    expect(page).to have_content("Mobile SAS")

    expect(page).to_not have_content("Grand Junction Mall")
    expect(page).to_not have_content("Grand Junction")
    expect(page).to_not have_content("23466")
    expect(page).to_not have_content("303-999-9189")
    expect(page).to have_content("Current Page")
  end

  it "has pagination" do
    visit root_path

    fill_in "search", with: "80202"
    click_on "Search Stores"

    expect(current_path).to eq(search_path)

    click_on "2"
    expect(page).to have_content("Current Page")

    expect(page).to have_content("17 Total Stores")
    expect(page).to have_content("I70 & Tower Rd")
    expect(page).to have_content("Aurora")
    expect(page).to have_content("11.65")
    expect(page).to have_content("303-373-9284")
    expect(page).to have_content("Big Box")
  end
end

# And I should see pagination links below the search results for the number of pages (2 in this case)
# And `1` is my current page but isn't a clickable link
# And `2` is a clickable link
# When I click `2`
# Then I should be taken to the next page of search results
# Then my current path should be "/search" (ignoring params)
# And in the params I should see `page=2`
# And I should see stores within 25 miles
# And I should see a message that says "17 Total Stores"
# And I should see the next 6 results
# And I should see the long name, city, distance, phone number and store type for each of the next 6 results
