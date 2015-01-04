require 'rails_helper'

RSpec.describe 'The posts create method should', :type => :request do

  before do
    @user = create(:user)
    @category = create(:category)
  end

  it "create a new post with the proper JSON response content when provided valid user auth_token" do
    post "/categories/#{@category.id}/posts/", 
      {post: 
        { title: "Post title 1", body: "Post body 1"}
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s, 'Authorization' => "Token token=#{@user.auth_token}" }
    expect( response.status ).to eq(201)
    expect( response.content_type ).to eq(Mime::JSON)
    expect( response.body ).to include("Post title 1")
    expect( response.body ).to include("Post body 1")
  end

  it "does not create a post without a valid user auth_token" do
    post "/categories/#{@category.id}/posts/", 
      {post: 
        { title: "Post title 1", body: "Post body 1"}
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s, 'Authorization' => "Token token=#{@user.auth_token}+fake" }
    expect( response.content_type ).to eq(Mime::JSON)
    expect( response.status ).to eq(401)
    expect( response.body ).to_not include("Post title 1")
    expect( response.body ).to_not include("Post body 1")
  end

end