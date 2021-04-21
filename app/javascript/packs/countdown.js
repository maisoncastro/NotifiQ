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
      setInterval(function () {
        start_timer();
      }, 1000); // 60 * 1000 milsec
    }
  });
};

const start_timer = () => {
  const now = Math.floor(Date.now() / 1000);
  const timeLeftDiv = document.getElementById("timeLeft");

  if (timeLeftDiv.dataset.expected_time != null) {
    const expected_visit_time = timeLeftDiv.dataset.expected_time;
    let timeLeftMilliseconds = expected_visit_time - now;

    if (timeLeftMilliseconds > -1) {
      let timeLeft = `${getMinutes(timeLeftMilliseconds)}:${getSeconds(
        timeLeftMilliseconds
      )}`;
      setTimeValueInPage(timeLeft);

      if (timeLeftMilliseconds == 60) {
        $("#nextinline").modal();
      }
    } else {
      $("#nextinline").modal("hide");
      $("#yourturn").modal({backdrop: 'static', keyboard: false})
    }
  }
};

const positionUpdate = () => {
  setPositionValueInPage();
  let waitTimeInMills = waitTime * 1000;
  const timePerPesonInLine = waitTimeInMills / currentPosition;
  setInterval(function () {
    setPositionValueInPage();
    decrementPosition();
  }, timePerPesonInLine);
};

const decrementPosition = () => {
  if (currentPosition > 0) {
    currentPosition--;
  }
};

const setPositionValueInPage = () => {
  let positionLeftDiv = document.getElementById("current_position");

  if (positionLeftDiv) {
    positionLeftDiv.innerHTML = currentPosition;
  }
};

export { countdown, positionUpdate };
