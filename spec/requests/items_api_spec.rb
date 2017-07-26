require "rails_helper"

RSpec.describe "items API" do
  it "can get item index" do
    items = create_list(:item, 3)
    get "/api/v1/items"

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.length).to eq(3)
  end

  it "can show and item" do
    item = create(:item)
    get "/api/v1/items/#{item.id}"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.length).to eq(6)
  end

  it "can delete an item" do
    item = create(:item)

    delete "/api/v1/items/#{item.id}"

    expect{(Destination.find(destination.id))}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "can create an item" do
    item_params = {name: "Thing", description: "Does stuff", image_url: "https://www.smashingmagazine.com/wp-content/uploads/2015/06/10-dithering-opt.jpg" }

    items = create_list(:item, 3)

    post "/api/v1/items/", params: {item: item_params}

    expect(Item.last.name).to eq("Thing")
  end

end

#
# When I send a GET request to `/api/v1/items`
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but not the created_at or updated_at
#
# When I send a GET request to `/api/v1/items/1`
# I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
#
# When I send a DELETE request to `/api/v1/items/1`
# I receive a 204 JSON response if the record is successfully deleted
#
# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
#
# * Verify that your non-GET requests work using Postman or curl. (Hint: `ActionController::API`). Why doesn't the default `ApplicationController` support POST and PUT requests?
