prompt = require 'prompt'
config = require('konfig')()
database = require('Context-Data').database(config)


database.connection().migrate.latest config.migrate
.then ->
  console.log "Initialized DB."

  prompt.start()
  prompt.get ['name', 'email', 'password'], (err, result) ->
    #TODO Create a user.
    
    console.log "Created user."
    process.exit()
