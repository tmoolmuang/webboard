# Webboard   [![Build Status](https://travis-ci.org/tmoolmuang/webboard.svg?branch=master)](https://travis-ci.org/tmoolmuang/webboard)

Webboard is a simple Ruby on Rails application that allows a user to post and share information on the bulletin board. 
It demonstrates the use of parent-child relationship tables. Users can create posts and comment on a post. 
Users can vote and like the posts. The user can edit and delete his or her own post. The app is similar to Bloccit but 
with a new layout. Standard size Amazon affiliated ads can be placed on the both side of the content. Current version
suppports 120 x 240 px, and 160 x 600 px banner.


The app is deployed on Heroku: https://webboard-tm.herokuapp.com/

The source code is here on GitHub: https://github.com/tmoolmuang/webboard

![p3](https://user-images.githubusercontent.com/24881495/28252314-4e087ece-6a45-11e7-9f36-8f9c43ddbe21.JPG)

# Setup and Configuration

**Languages and Frameworks**: Ruby on Rails and Bootstrap

**Ruby version 2.3.0**

**Rails version 4.2.8**

**Databases**: SQLite (Test, Development), PostgreSQL (Production)

**Development Tools and Gems include**:

+ Devise for user authentication

+ bootstrap for layout and carousel slideshow

+ kaminari for pagination

+ factory_girl_rails, and faker for seeding data

+ rspec, capybara, database_cleaner for testing

![p1](https://user-images.githubusercontent.com/24881495/28252319-6d04d854-6a45-11e7-8a0d-2f018e1ad9df.JPG)
