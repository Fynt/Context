config = require('konfig')()
context = require('Context-Data')(config)

database = context.database()
database.connection().migrate.latest config.migrate
.then ->
  console.log "Initialized DB."
  process.exit()
