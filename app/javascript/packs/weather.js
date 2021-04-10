const weatherapp = () => {
    const weatherDiv = document.querySelector('#weather-container');

    const lat = weatherDiv.dataset.latitude;
    const long = weatherDiv.dataset.longitude;

  // const fetchWeatherByCoordinates = (long, lat) => {


    const apiKey = '69690bb66a4000f12020a1edcc42b638';
    const locationUrl = `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${long}&appid=${apiKey}`;
    fetch(locationUrl)
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        showWeather(data);
      });
  // };
};

function showWeather( input ) {
  const celcius = Math.round(parseFloat(input.main.temp)-273.15);
  const infos = document.querySelector("#description");
  infos.infoHTML = "";

  document.getElementById('info').innerHTML = `${input.weather[0].description}, ${celcius}&deg, ${input.name}`;
  const infoHTML = `<p class="temperature"><img src="http://openweathermap.org/img/wn/${input.weather[0].icon}.png" alt="weather icon"></p>`;
  infos.insertAdjacentHTML('beforeend', infoHTML);
};

// window.onload = function() {
//   fetchWeatherByCoordinates('-73.6816067', '45.5133291');
// }

export { weatherapp };
