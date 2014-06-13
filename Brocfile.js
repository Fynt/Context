// this will need to build multiple apps... which won't be at all complicated...

// app 1: the front end of the site
  
  // the front end will be store all over the dang place
  // "vendor/context-frontend" will be the basic app which knows how to load and render pages
  // each extension can have "blocks" which will be registered as components (probably)
  // each extension might also have a "frontend" folder, which would just inject itself into the ember frontend
  //    I was thinking this could be used for junk like the store cart, checkout, wishlist, etc. Stuff that's 
  //    obviously custom, and which doesn't really fit into the blueprint/block junk
  // finally, the active theme will override any equivalently named templates

// app 2: the context cms

  // I want to allow each extension to optionally control the "list", "list-condensed", and "form" views for blueprint data
  // I'm also thinking that we'll allow for more direct insertion of functionality, similar to the frontend

// app 3: the front-end editor

  // no idea...