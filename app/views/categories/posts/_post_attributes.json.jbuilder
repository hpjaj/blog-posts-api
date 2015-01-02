json.post do
  json.id @post.id
  json.title @post.title
  json.body @post.body
end