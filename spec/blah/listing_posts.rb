require 'rails_helper'

RSpec.describe 'The categories show method should', :type => :request do

  before do
    @user = create(:user)
    @category1 = create(:category, title: "Category 1")
    @category2 = create(:category, title: "Category 2")
    @post1 = create(:post, title: "Post one", category_id: @category1.id)
    @post2 = create(:post, title: "Post two", category_id: @category1.id)
    @post3 = create(:post, title: "Post three", category_id: @category2.id)
  end

  it "return all of the posts associated with a given category in JSON" do
    get "/categories/#{@category1.id}", {}, {'Accept' => Mime::JSON}
    expect( response.status ).to eq(200)
    expect( response.content_type ).to eq(Mime::JSON)
    expect( response.body ).to include("Category 1")
    expect( response.body ).to include("Post one")
    expect( response.body ).to include("Post two")
    expect( response.body ).to_not include("Post three")
  end

end