Fretrograde! - Shopping Cart App

Project 2 for General Assembly Web Development Immersive Program

June 13, 2014

Contributors:
- George Straehle
- Amanda McDermott
- Kathleen Votolato


Try out [Fretrograde!](http://serene-shore-9429.herokuapp.com/)

Description: Fretrograde! is a guitar-store themed shopping cart app that uses Ruby on Rails, Javascript, PostgreSQL, and Stripe payment processing.

Technology used:
- Ruby on Rails
- Javascript
- PostgreSQL
- [jQuery-Currency](https://github.com/gilbitron/jQuery-Currency)
- [Stripe](https://github.com/stripe/stripe-ruby)
- [Twitter Bootstrap](http://getbootstrap.com/)


Features included in this app:
- Users can browse catalog of guitars
- Users can sort by price (ascending/descending) and rating
- Users have a live cart preview
- Users can can checkout
- Users can view order history
- Admin Users can modify inventory


Instructions for local deployment:
- Clone this repository into your projects folder
- Run bundle install
- Run rake db:create
- Run rake db:setup
- Add Stripe API keys to the your project (see below instructions)
- Startup server and enjoy!

Setting up Stripe API keys on your local environment:
- Go to [www.stripe.com](http://www.stripe.com) and create an account
- Go into your account settings (under Your Account) and click on API Keys.
- In the project root directory, create a new file named .env and add the following lines to it:

`PUBLISHABLE_KEY=[paste your Test Publishable Key here]`

`SECRET_KEY=[paste your Test Secret Key here]`

- Open the .gitignore file and add `.env` to it
- That's it!

Ruby version: 2.1.1p76
