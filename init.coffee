prompt = require 'prompt'
config = require('konfig')()
database = require('Context-Data').database config
models = require('Context-Data').models config


database.connection().migrate.latest config.migrate
.then ->
  console.log "Initialized DB."

  schema =
    properties:
      name:
        pattern: /^[a-zA-Z\s\-]+$/
        message: 'Name must be only letters, spaces, or dashes'
        required: true
      email:
        required: true
      password:
        hidden: true

  prompt.start()
  prompt.get schema, (err, result) ->
    user = models.User.forge
      name: result.name
      email: result.email
    user.set_password result.password

    user.save().then ->
      console.log "Created user."
      process.exit()
    .catch (error) ->
      console.log "Could not create user: #{error}"
      process.exit 1
