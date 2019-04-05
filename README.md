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

