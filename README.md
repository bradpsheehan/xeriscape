# Xeriscape
xeriscape is a simple garden management interface that lists the plants in your garden and allows you to water each plant individually, while also giving you each plant's health status and root length. 

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

### Run the Tests
`bundle exec rspec`

### KNOWN ISSUES
Garden show page react component doesn't attach to the DOM on initial page load when coming from the garden index page. If you navigate from root to a garden show page you have to refresh the page for the component to attach to the DOM. If you type a garden path straight into the url then the show page loads just fine. Assumption is that the `DOMContentLoaded` event is not being fired when coming from the link on the garden index.

### TODOs
Add more specs (including front end `jest` specs)

Features to consider:

* Add ability to `plant_seeds` in garden

* Add ability to `remove_plant` from garden

* Factor weather into calculation of how much water a plant needs (maybe add plant status of :thirsty)

* Random 'invasive species attacks' (could be based on weather patter)

* Overall garden health diagnosis
