#Blog-Posts-API Rails Application

Rails API for creating, updating, and listing blog posts and categories. 

To test drive the Rails API:

- Git clone the repository
- Run `$ bundle`
- Migrate and seed the SQLite3 databases (`rake db:migrate` and `rake db:seed`)
- Start the server, `$ rails s`, and browse to `localhost:3000`
- View existing category's list and associated blog posts
- Create and update blogs posts (through curl or Postman)
- To visualize the JSON data, add .json to the end of the URL
- Or use a tool like the [Postman - REST Client](https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm?hl=en) Chrome extension to visualize and manipulate the JSON data
  - Create a custom **Accept** header preset
    - Click *Manage Presets* and create a header preset called `JSON Accept`
    - Set the `key` to `Accept`
    - Set its `value` to `application/json`
  - Create a custom **Authorization** header preset
    - Click *Manage Presets* and create a header preset called `JSON Authorization`
    - Set the `key` to `Authorization`
    - Set its `value` to `Token token="tokenGoesHere"`
  - Create and access the JSON data with the following URL / HTTP verb combinations
    - http://localhost:3000/categories/ with GET
    - http://localhost:3000/categories/83/ with GET  *(substitute the number 83 for a relevant category ID based on the results of your `seeds.rb` file seeding)*
    - http://localhost:3000/categories/84/posts/480  *(substitute the numbers 84 and 480 for a relevant category and post ID based on the results of your `seeds.rb` file seeding)*
      - Use the **Authorization** custom header with POST, PUT, PATCH or DELETE
      - Substite *tokenGoesHere* with a user's **auth_token** attribute which you can obtain from the `rails console` by running `User.first`, for example
    - http://localhost:3000/categories/84/posts/ with POST, along with form-data
    - http://localhost:3000/categories/84/posts/480 with PUT or PATCH, along with altered form-data
    - http://localhost:3000/categories/84/posts/480 with DELETE 

