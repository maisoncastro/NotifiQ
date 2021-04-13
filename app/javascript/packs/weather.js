const weatherapp = () => {
    const weatherDiv = document.querySelector('#weather-container');

    const lat = weatherDiv.dataset.latitude;
    const long = weatherDiv.dataset.longitude;

    const apiKey = '69690bb66a4000f12020a1edcc42b638';
    const locationUrl = `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${long}&appid=${apiKey}`;
    fetch(locationUrl)
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        showWeather(data);
      });
};

function showWeather( input ) {
  const celcius = Math.round(parseFloat(input.main.temp)-273.15);
  const weatherInfo = document.querySelector("#info");
  const weatherCity = document.getElementById('city');
  const weatherIcon = document.querySelector("#weather-icon");

  weatherInfo.infoHTML = "";
  weatherCity.infoHTML = "";
  weatherIcon.infoHTML = "";

  // document.getElementById('info').innerHTML = `${celcius}&deg`;
  // document.getElementById('info').innerHTML = `${input.weather[0].description}`;

  const infoHTML = `<p>${celcius}&deg</p><p>${input.weather[0].description}</p>`;
  weatherInfo.insertAdjacentHTML('beforeend', infoHTML);

  const cityHTML = `<h2>${input.name}, ${input.sys.country}</h2>`;
  weatherCity.insertAdjacentHTML('beforeend', cityHTML);

  // document.getElementById('city').innerHTML = `${input.name}`;

  const iconHTML = `<p class="temperature"><img src="http://openweathermap.org/img/wn/${input.weather[0].icon}.png" alt="weather icon"></p>`;
  weatherIcon.insertAdjacentHTML('beforeend', iconHTML);
};

// window.onload = function() {
//   fetchWeatherByCoordinates('-73.6816067', '45.5133291');
// }

export { weatherapp };
