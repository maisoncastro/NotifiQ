const fetchWeatherByCoordinates = (long, lat) => {
  const apiKey = '69690bb66a4000f12020a1edcc42b638';
  const locationUrl = `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${long}&appid=${apiKey}`;
  fetch(locationUrl)
    .then(response => response.json())
    .then((data) => {
      showWeather(data);
    });
};

function showWeather( input ) {
  document.getElementById('description').innerHTML = `${input.weather[0].description}, ${celcius}&deg`;
  document.getElementById('weather-icon').innerHTML = input.name;
  const weather_icon = '<img src="http://openweathermap.org/img/wn/${data.weather[0].icon}.png" alt="weather icon">${Math.round(data.main.temp)}°C</p>'
}

window.onload = function() {
  fetchWeatherByCoordinates('-73.6816067', '45.5133291');
}

// // searchLocation.addEventListener("click", (locationEvent) => {
// //   locationEvent.preventDefault();
//   navigator.geolocation.getCurrentPosition((dataLocation) => {
//     const latitude = dataLocation.coords.latitude;
//     const longitude = dataLocation.coords.longitude;

//     if (longitude && latitude) {
//       infos.classList.add("weather-container");
//       fetchWeatherByCoordinates(longitude, latitude);
//     }
//   });
// // });

export { fetchWeatherByCoordinates };
