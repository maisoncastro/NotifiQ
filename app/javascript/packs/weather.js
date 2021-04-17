const weatherapp = () => {
    const weatherDiv = document.querySelector('#weather-container');

    if (weatherDiv) {
      const lat = weatherDiv.dataset.latitude;
      const long = weatherDiv.dataset.longitude;

      const apiKey = process.env.WEATHER_API_KEY;

      const locationUrl = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${long}&appid=${apiKey}`;
      fetch(locationUrl)
        .then(response => response.json())
        .then((data) => {
          showWeather(data);
        });
    }
};

function showWeather( input ) {
  const celcius = Math.round(parseFloat(input.main.temp)-273.15);
  const weatherInfo = document.querySelector("#info");
  const weatherCity = document.querySelector("#city");
  const weatherIcon = document.querySelector("#weather-icon");

  weatherInfo.infoHTML = "";
  weatherCity.infoHTML = "";
  weatherIcon.infoHTML = "";

  const infoHTML = `<p>${celcius}&deg</p><p>${input.weather[0].description}</p>`;
  weatherInfo.insertAdjacentHTML('beforeend', infoHTML);

  const cityHTML = `<h2>${input.name}, ${input.sys.country}</h2>`;
  weatherCity.insertAdjacentHTML('beforeend', cityHTML);

  const iconHTML = `<p class="temperature"><img src="http://openweathermap.org/img/wn/${input.weather[0].icon}.png" alt="weather icon"></p>`;
  weatherIcon.insertAdjacentHTML('beforeend', iconHTML);
};

export { weatherapp };
