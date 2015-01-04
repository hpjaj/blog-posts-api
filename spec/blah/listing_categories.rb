require 'rails_helper'

RSpec.describe 'The categories index method', :type => :request do

  it "return all of the categories in JSON" do
    category1 = Category.create!(title: "Movies")
    category2 = Category.create!(title: "Restaurants")
    get '/categories', {}, {'Accept' => Mime::JSON}
    expect( response.status ).to eq(200)
    expect( response.body ).to include("Movies")
    expect( response.body ).to include("Restaurants")
    expect( response.content_type ).to eq(Mime::JSON)
  end

end