## Winston
Winston is an educational concierge platform to connect students to valuable resources like mentors, counselors, etc

## Setup Guide

- Install ruby version ```ruby 2.3.6p384 (2017-12-14 revision 61254) [x86_64-darwin17]```
  - First install rbenv ```brew install rbenv```
  - ```rbenv init```
  - ```rbenv install 2.3.6```
- Install ruby on rails ```4.2.5```
- Install bundler ```gem install bundler```
- Install all gems in Gemfile ```bundle install```
- Run migration file and get all the seed data ```bundle exec rake db:migrate```
- Run rails server ```rails server```
- Once rails server is running, you can go to http://localhost:3000


## Server deployment
Currently it is still a bit manual but here are the steps to deploy to Digital Ocean: https://cloud.digitalocean.com/projects/6f61b1a8-bc80-4640-905f-334d34d59e40/resources?i=c71763&preserveScrollPosition=true

- First we want to ssh into our DigitalOcean Server.
  - ```ssh tedwu@68.183.168.36```
  - Ask me for the password to ssh into this
- Once we are in, you can cd ~/var/www/winston/code to go to the application code
- Added github hooks and since there is a 2FA, I created a personal auth token (also ask me if you need the personal auth token)
- If there are new gems, only install the gems in production
  - ```bundle install —deployment —without development test```
- Precompile rails assets and do db migrations
  - ```bundle exec rake assets:precompile db:migrate RAILS_ENV=production```
- Restart the application
  - ```bundle exec passenger-config restart-app $(pwd)```
  - if address is being used, then restart nginx by killing the process id
    - ```sudo pkill -f nginx; sudo systemctl start nginx```

Go to the server: 68.183.168.36
My next step is to buy a domain and set up DNS so that we can map this IP to a pretty url.
