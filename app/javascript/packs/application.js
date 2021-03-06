// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("moment");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
// CSS
import "mapbox-gl/dist/mapbox-gl.css";
// internal imports
import { initMapbox } from "../plugins/init_mapbox";
import { countdown, positionUpdate } from "./countdown.js";
import { weatherapp } from "../packs/weather";
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener("turbolinks:load", () => {
  // Call your functions here, e.g:
  // initSelect2();
  initMapbox();
  weatherapp();
  countdown();
});
// let positionLeftDiv = document.getElementById("current_position");
// if (positionLeftDiv) {
//   positionUpdate();
// }

// export { currentTime }; // <-- Add this line

// const timeleft = document.getElementById("timeLeft");
// if (timeleft) {
//   setInterval(function () {
//     // your code goes here...
//     countdown();
//     // console.log(time);
//   }, 1000); // 60 * 1000 milsec
// }
