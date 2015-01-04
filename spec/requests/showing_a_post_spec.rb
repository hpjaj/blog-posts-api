require 'rails_helper'

RSpec.describe 'The posts show method should', :type => :request do

  before do
    @user = create(:user)
    @category = create(:category, title: "Category 1")
    @post = create(:post)
  end

  it "return the post title and body in JSON" do
    get "categories/#{@category.id}/posts/#{@post.id}", {}, {'Accept' => Mime::JSON}
    expect( response.status ).to eq(200)
    expect( response.content_type ).to eq(Mime::JSON)
    expect( response.body ).to include("Post title")
    expect( response.body ).to include("Post body")
  end

end