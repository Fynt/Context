prompt = require 'prompt'
config = require('konfig')()
models = require('Context-Data').models config
database = require('Context-Data').database config
blueprint_manager = require('Context-Data').blueprint_manager config


# Init the DB.
database.connection().migrate.latest config.migrate
.then ->
  console.log "Initialized DB."

  # Make them blueprints!
  blueprint_manager.register_blueprints().then ->

    # Define the data structure we want to collect from the user.
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

    # Collect data from the user.
    prompt.start()
    prompt.get schema, (err, result) ->
      # Set some admin permissions so the new user isn't locked out of literally
      # everything.
      for model in ['User', 'Group']
        for action in ['view', 'save', 'publish', 'destroy']
          do (model, action) ->
            models.Permission.forge
              group_id: 1
              type: 'model'
              resource: model
              action: action
              is_allowed: true
            .save().then ->
              console.log "Created #{model}:#{action}"

      # Create the admin user account.
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
