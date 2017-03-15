== README

* Ruby version: 2.1.10

##Database creation  
Configure the following environment variable in `config/application.yml`  
Figaro will load it into the environment  
CURRENTS_DB_NAME  
CURRENTS_PSQL_USERNAME  
CURRENTS_PSQL_PASSWORD  
  
##How to run the test suite  
`rspec test`  

##Rake tasks
`rake check_location:files` to check if coordinate file exists for every location.  

##Staging  
currents-dev.herokuapp.com

Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
