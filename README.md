# README

### Yonder
Built using Ruby on Rails.  

The essence of this app is to search weather based on user temperature preference.  
Users can favorite locations for future reference.
This was a solo project with a 1 week time cap.

Production App: https://blue-yonder.herokuapp.com/

Ruby Version: 2.4.1

Rails Version: 5.1.6

To run this project:

   - git clone git@github.com:emmiehayes/blue_yonder.git
   - cd blue_yonder
   - bundle install
   - rake db:{create, migrate}
   - rails s

Creating Accounts:

- visit the /login page
- passwords must be at least 8 characters

Testing:

- This project uses RSpec for testing
- Run testing using the `rspec` command
- You may need to db:test:prepare before running test.
