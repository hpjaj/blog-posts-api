require 'rails_helper'

RSpec.describe 'The posts update method should', :type => :request do

  before do
    @user = create(:user)
    @category = create(:category)
    @post = create(:post, title: "Post About Lions")
  end

  it "update an existing post when provided a valid user auth_token" do
    patch "categories/#{@category.id}/posts/#{@post.id}",
      { post: { title: 'Post About Tigers' } }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s, 'Authorization' => "Token token=#{@user.auth_token}" }
    expect( response.status ).to eq(204)

    get "categories/#{@category.id}/posts/#{@post.id}", {}, {'Accept' => Mime::JSON}
    expect( response.status ).to eq(200)
    expect( response.content_type ).to eq(Mime::JSON)
    expect( @post.reload.title ).to eq("Post About Tigers")
  end

  it "should not update an existing post when provided an invalid user auth_token" do
    patch "categories/#{@category.id}/posts/#{@post.id}",
      { post: { title: 'Post About Tigers' } }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s, 'Authorization' => "Token token=#{@user.auth_token}+fake" }
    expect( response.status ).to eq(401)

    get "categories/#{@category.id}/posts/#{@post.id}", {}, {'Accept' => Mime::JSON}
    expect( response.status ).to eq(200)
    expect( response.content_type ).to eq(Mime::JSON)
    expect( @post.reload.title ).to eq("Post About Lions")
  end

end