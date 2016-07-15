# Bubble Tea
![Build Status](https://codeship.com/projects/98a8de30-2509-0134-2db6-0e3391f87f23/status?branch=master)
![Code Climate](https://codeclimate.com/github/mobremski/bubble-tea.png)
![Coverage Status](https://coveralls.io/repos/mobremski/bubble-tea/badge.png)

# About This Project
Our app is a Bubble Tea Shop review site.  This is a group project for Launch Academy.

# Collaborators:
- Michael Obremski (https://github.com/mobremski/)
- Shelly Stuart (https://github.com/shellystuart)
- Padrig Tuck (https://github.com/padrigirdap)
- Alice Liou (https://github.com/amliou)

# Features:
- Ability to add a bubble tea shop to be reviewed.
- Ability to rate the shop (score on a scale of 1-5) and to optionally comment on it (write a review).
- Ability to upvote or downvote a review utilizing AJAX so that a complete page reload isn't necessary.
- Sign up and authentication system for users (with devise).
- Ability to upload a profile photo (with CarrierWave).
- Ability to search for items.
- An admin role where admins are able to delete reviews or items if they are deemed to be inappropriate.
- Emails are sent to the owner of an item when a new review is posted about it.
- An index page for items that live-updates using React.js

# To get this project on your machine
1. From your terminal, run ```git clone https://github.com/mobremski/bubble-tea.git```
2. Switch into the project directory by running ```cd bubble-tea```
3. Run ```bundle install``` and ```npm install```to install the necessary dependencies on your machine.
4. Start your server by running ```rails server``` from your command line. In a separate tab, run ```npm start```.
5. Visit ```localhost:3000``` to run through the app!

Alternatively, you can also find our project on Heroku at: https://dry-oasis-46949.herokuapp.com/

# Technologies in this Project
- Ruby on Rails
- Devise
- React
- AJAX
- CarrierWave
- Capybara
- NPM
