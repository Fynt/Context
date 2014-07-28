#Context Skeleton

An express app, and broccoli(?) pipeline.

`coffee init.coffee` and `npm start` for the server
`broccoli serve` to get the ember apps running... maybe... it might not be that easy.

It would be nice to eventually set up our own cli. Then, using Context could be pretty simple.

`context serve`

- run `npm start` to get the server running
- in the development environment, start the Broccoli process that watches for file changes (broccoli-timepiece?)

For now, we can just do it in two terminal windows.

`context build`

Build the ember apps, and prepare them for deployment

`context generate [command]`

I was thinking this might be nice to have later. Like `context generate extension rad-extension`, but maybe that's dumb? It could also generate ember just using [the loom generators](https://github.com/cavneb/loom-generators-ember-appkit).
