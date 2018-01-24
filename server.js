#!/usr/bin/env node
var prerender = require("prerender");

// borrow from https://github.com/prerender/prerender/blob/master/server.js
var server = prerender({
  chromeLocation: "/usr/lib/chromium/chrome",
  chromeFlags: [
    "--headless",
    "--disable-gpu",
    "--remote-debugging-port=9222",
    "--hide-scrollbars",
    "--no-sandbox"
  ]
});

server.use(prerender.sendPrerenderHeader());
server.use(prerender.blockResources());
server.use(prerender.removeScriptTags());
server.use(prerender.httpHeaders());

server.start();
