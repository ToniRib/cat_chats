![](https://making-the-web.com/sites/default/files/clipart/149179/cat-head-outline-149179-8813506.jpg)

# Cat Chats!

Because cats are cute and the internet is basically for posting photos of them and then commenting on how cute they are.

## Description

This project is a simple messaging application that allows some (currently hard-coded) users to chat with each other. It uses postgres, Ruby on Rails, and React.  To save time on styling, I used bootstrap.

## Functionality

- Log in as existing user from the `seeds.rb` file
- View active conversation list
- Select an active conversation to view messages
- Add messages to an active conversation

There's a 1 second polling interval set up so you can see messages from the other user pop up fairly quickly.

### Limitations

Things I did not get to include:
- Better styling (and more cat photos). I'm a big fan of styled components in React and would have loved to have the time to use those.
- Redirect to conversations page when you hit the home page if you're already logged in
- Create new conversations with other users
- Displaying dates in a user's timezone
- Error handling. There's some support for this on the backend but the front end doesn't care about it.

## Running locally

### Dependencies

This app uses ruby 2.6.3, so that must be installed locally for you to run this. It also runs on postgres, which you can install from [postgresapp.com](https://postgresapp.com/).

### Steps

1. Clone the app using `git clone https://github.com/ToniRib/cat_chats.git` from your terminal
2. Navigate into the application
3. Run `yarn install` to install the JavaScript dependencies
4. Run `bundle install` to install the Ruby dependences
5. Run `bundle exec rails db:drop db:create db:migrate db:seed` to blow away any database you might, set up a new one, and seed it with some fun cat-related data.
6. Run `rails s` to start up the rails server
7. Open the site in Chrome by visiting `localhost:3000`. Sign in as one of the seeded users
8. Open an incognito window in Chrome and visit `localhost:3000`. Sign in as a user who has an active conversation with your first signed in user.
9. Chat! Cat topics preferred.
