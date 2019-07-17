# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


This is a simple application with Blogs and Users.

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