FactoryGirl.define do
  factory :post do
    title "Post title"
    body "Post body"
    user
    category
  end
end