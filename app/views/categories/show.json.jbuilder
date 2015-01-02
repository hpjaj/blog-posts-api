json.array! @posts do |post|
  json.category_title post.category.title
  json.category_id post.category.id
  json.post_title post.title
  json.post_body post.body
  json.post_id post.id
end



