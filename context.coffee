# hey, this will start the server!

# the server will have to do a few things:
# - auth and permissions
# - load up extensions, gather up blueprints, and provide blueprint APIs
# - display the admin ember app for /context/* requests (GET only)
# - display the front end for any requests !/context and !/api
# - somehow know to inject extra junk if there's a ?edit param (or something like that) for the front end editor
#
# it should also be smart enough to know to serve the ember apps from a tmp dir in development mode, and a dist dir in production

# load the config
config = require('konfig')()
server = require('Context-Data').server(config)

# we need to register all of the extensions in here
# each extension will likely have some blueprints
# I'm also thinking we'll maybe have a "plugins" folder, or something. Basically, a way
# of creating functionality that allows people to add observers to the context events.
# That way, different search providers could just be extensions that register on blueprint
# save and creat events... as a completely vague example

# my last thought it a little more contentious... allowing extensions to have a "server" folder
# which would allow them full server access. The could register routes, add middleware, access the DB,
# and basically anything else they feel like. We likely couldn't allow these on the hosted service
# but I bet people will want them for self-hosted junk.

server.start()
