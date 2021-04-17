
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
  $(function(){
    if($('body').is('#counter')){
        document.addEventListener("DOMContentLoaded", () => {
          const timeLeftDiv = document.getElementById("timeLeft");
        });
        start_timer();
    }
  });
}

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

          if (timeLeftDiv) {
            console.log("timer")
            setInterval(function () {

              countdown();
              // console.log(time);
            }, 1000); // 60 * 1000 milsec
          }
        } else {
          $('#nextinline').modal('hide');
          $("#yourturn").modal();
        }
      }

};

export { countdown };
