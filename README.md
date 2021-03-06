This is a simple application with Blogs and Users.

Heroku link - https://vbukhonov-ruby-blog.herokuapp.com/

Before starting your work with it, you can first prepopulate DB with some 
simple data. In order to do that, after you have run command:

```
rake db:migrate
```

run command:

```
rake db:seed
```

It will populate DB with 1 User with 1 Blog.

User's credentials are:

```
ruby_on_rails_blog_app@gmail.com
12345
```

# HOWTO for blog creation via JSON API
First of all, we are going to assume that we are using Postman or some other
 tool with similar abilities.
* Perform GET request to the "/login" url. It will return HTML, and you need
 to copy and save the CSRF token from it.
* Perform POST request to the "/sessions" url. You should send "form-data"
  or x-www-form-urlencoded request.
  
  Use the following Headers:
    * Content-Type - corresponds to the type of request and should be equal to
      application/form-data or application/x-www-form-urlencoded
    * X-CSRF-Token - contains the value of CSRF token, which we get on
      the previous step
  
  Then, provide parameters `email` and `password` in the body, and now you
   can perform the authorization request.

* Now, when you are logged in, you can perform API call and send JSON to create
  a new Blog. You need to provide POST request to the "/api/v1/blogs_api" url.
  
  In Headers set Content-Type to application/json.
  For the Body you should define that it is a raw JSON and provide
   `title` and `text` strings, e.g.
   ```
   {
   	"title": "Blog from API",
   	"text": "Some text generated by API"
   }
   ```
   You will receive JSON with new Blog instance.

* Finally, logout with a current user by performing GET to the "/logout" url.