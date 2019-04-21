// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css";

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html";

import { Elm } from "../elm/src/Main.elm";

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

// var app = Elm.Main.init({
//   node: document.getElementById("elm-main")
// });

var storageKey = "store";
var flags = localStorage.getItem(storageKey);
var app = Elm.Main.init({
  flags: flags,
  node: document.getElementById("elm-main")
});

app.ports.storeCache.subscribe(function(val) {
  if (val === null) {
    localStorage.removeItem(storageKey);
  } else {
    localStorage.setItem(storageKey, JSON.stringify(val));
  }

  // Report that the new session was stored succesfully.
  setTimeout(function() {
    app.ports.onStoreChange.send(val);
  }, 0);
});

// Whenever localStorage changes in another tab, report it if necessary.
window.addEventListener(
  "storage",
  function(event) {
    if (event.storageArea === localStorage && event.key === storageKey) {
      app.ports.onStoreChange.send(event.newValue);
    }
  },
  false
);
