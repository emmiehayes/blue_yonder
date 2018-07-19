# README

Yonder is built using Ruby on Rails.  The essences of this app is to search weather based on a user temperature preferences.  Users can favorite locations for future reference. This was a solo project with a 1 week time cap.

Production App: https://blue-yonder.herokuapp.com/

Ruby Version: 2.4.1
Rails Version: 5.1.6

Setup
To run this project:
git clone git@github.com:emmiehayes/blue_yonder.git
cd blue_yonder
bundle install
rake db:{create,migrate}
rails s

Testing
This project uses RSpec for testing and can be run with the command rspec
You may need to rake db:test:prepare before running the tests.
