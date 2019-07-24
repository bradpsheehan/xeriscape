# README

### Prerequisites
ruby: `2.6.0` install using your ruby manager of choice 
yarn: `brew install yarn`

### Setup
Install gems: `bundle install`

Initialize NodeJS modules: `yarn install`

Initialize postgres: `docker-compose up`

Initialize database: `bundle exec rails db:create && bundle exec rails db:migrate && bundle exec rails db:seed`

Start rails server: `rails s`

Start webpack dev server: `./bin/webpack-dev-server`


### TODOs
Add more specs

Add sorting (other than the default alpha sort)

Add CSV download
