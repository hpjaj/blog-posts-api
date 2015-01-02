#Blog-Posts-API Rails Application

App for creating, modifying, and deleting blog posts. Returns formatted responses in both HTML and JSON.

To test drive the application:

Git clone the repository
Run $ bundle
- Migrate and seed the SQLite3 databases (rake db:migrate and rake db:seed)
- Start the server, $ rails s, and browse to localhost:3000
- Create, edit and delete a blog post
- To visualize the JSON data, add .json to the end of the URL. For example:
- Or use a tool like the Postman - REST Client Chrome extension to visualize the JSON data
  - Create a custom accept header preset
    - Click Manage Presets and create a header preset called JSON Accept
    - Set the key to Accept
    - Set its value toapplication/json`
