# Valera-Online

![Unit Tests & Lint](https://github.com/ssshazam/valera-online/workflows/Unit%20Tests%20&%20Lint/badge.svg)

### Ruby version: 3.0.3

### Database installation
* sudo apt update
* sudo apt install postgresql postgresql-contrib
* sudo -i -u postgres
* createuser --interactive
* createdb myapp
* sudo adduser myapp

### Setup
* gem install bundler
* bundle install
* rails db:setup

### Run tests
* rspec

### Run app
* rails s
