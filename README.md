# README

* Ruby version: 2.1.10

## Database creation  
Configure the following environment variable in `config/application.yml`.  
Check out `config/application.yml.sample` to know about all the variables used in the app.  
Figaro will load it into the environment  
  
## How to run the test suite  
`rspec test`  

## Rake tasks
`rake check_location:files` to check if coordinate file exists for every location. 
`rake db:seed:single['<model_name>']` to seed populate single table. Seed file must be present in `db/seeds/`. 

## Staging  
[currents-dev.herokuapp.com](https://currents-dev.herokuapp.com)
