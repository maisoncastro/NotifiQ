import moment from "moment";

// getting minutes

const getMinutes = (time) => {
  return Math.floor(time / 60);
};

const getSeconds = (time) => {
  let seconds = time % 60;

  // add leading zero when under 10
  seconds = seconds < 10 ? "0" + seconds : seconds;
  return seconds;
};

const setTimeValueInPage = (timeValue) => {
  const timeLeftDiv = document.getElementById("timeLeft");

  if (timeLeftDiv) {
    timeLeftDiv.innerHTML = timeValue;
  }
};

const countdown = () => {
  $(function () {
    if ($("body").is("#counter")) {
      document.addEventListener("DOMContentLoaded", () => {
        const timeLeftDiv = document.getElementById("timeLeft");
      });
      start_timer();
      setPositionValueInPage();
      setInterval(function () {
        start_timer();
        setPositionValueInPage();
      }, 1000); // 60 * 1000 milsec
    }
  });
};

const start_timer = () => {
  let timeLeftInSeconds = getTimeLeftInSeconds();
  if (timeLeftInSeconds) {
    if (timeLeftInSeconds > -1) {
      let timeLeft = `${getMinutes(timeLeftInSeconds)}:${getSeconds(
        timeLeftInSeconds
      )}`;
      setTimeValueInPage(timeLeft);


      if (timeLeftInSeconds == 60) {
        $("#nextinline").modal();
      }
    } else {
      $("#nextinline").modal("hide");
      $("#yourturn").modal({backdrop: 'static', keyboard: false})
    }
  }
};

const getTimeLeftInSeconds = () => {
  const now = Math.floor(Date.now() / 1000);
  const timeLeftDiv = document.getElementById("timeLeft");
  if (timeLeftDiv && timeLeftDiv.dataset.expected_time != null) {
    const expected_visit_time = timeLeftDiv.dataset.expected_time;
    return expected_visit_time - now;
  } else {
    return false;
  }
};

const getCurrentPosition = () => {
  let timeLeftInSeconds = getTimeLeftInSeconds();
  if (timeLeftInSeconds > 108) return 11;
  if (timeLeftInSeconds > 96) return 10;
  if (timeLeftInSeconds > 84) return 9;
  if (timeLeftInSeconds > 72) return 8;
  if (timeLeftInSeconds > 60) return 7;
  if (timeLeftInSeconds > 48) return 6;
  if (timeLeftInSeconds > 36) return 5;
  if (timeLeftInSeconds > 24) return 4;
  if (timeLeftInSeconds > 12) return 3;
  if (timeLeftInSeconds > 0) return 2;

  return 1;
};

const setPositionValueInPage = () => {
  let positionLeftDiv = document.getElementById("current_position");

  if (positionLeftDiv) {
    positionLeftDiv.innerHTML = getCurrentPosition();
  }
};

export { countdown };
