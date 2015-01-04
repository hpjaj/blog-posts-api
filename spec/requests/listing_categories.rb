require 'rails_helper'

RSpec.describe 'The categories index method', :type => :request do

  it "return all of the categories in JSON" do
    category = Category.create!(title: "Movies")
    get '/categories', {}, {'Accept' => Mime::JSON}
    expect( response.status ).to eq(200)
    expect( response.body ).to include("Movies")
    expect( response.content_type ).to eq(Mime::JSON)
  end

end