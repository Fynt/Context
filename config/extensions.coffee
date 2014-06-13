# this should probably be in its own folder
# it's annoying that we have to add extensions via bower AND in this config file
# so I was thinking it would probably be nice to have a command for this... something like `context extension add [name]`
# I was also thinking that the order they're listed here would control how they're listed in the admin
extensions = [
  "context-blog" # in vendor
  "gravitypope-store" #in workbench
]

module.exports = extensions