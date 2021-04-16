// class CountDown {
//   constructor(expiredDate, onRender, onComplete) {
//     this.setExpiredDate(expiredDate);

//     this.onRender = onRender;
//     this.onComplete = onComplete;
//   }

//   setExpiredDate(expiredDate) {
//     // get the current time
//     const currentTime = new Date().getTime();

//     // calculate the remaining time
//     this.timeRemaining = expiredDate.getTime() - currentTime;

//     this.timeRemaining <= 0 ? this.complete() : this.start();
//   }

//   complete() {
//     if (typeof this.onComplete === "function") {
//       onComplete();
//     }
//   }
//   getTime() {
//     return {
//       days: Math.floor(this.timeRemaining / 1000 / 60 / 60 / 24),
//       hours: Math.floor(this.timeRemaining / 1000 / 60 / 60) % 24,
//       minutes: Math.floor(this.timeRemaining / 1000 / 60) % 60,
//       seconds: Math.floor(this.timeRemaining / 1000) % 60,
//     };
//   }

//   update() {
//     if (typeof this.onRender === "function") {
//       this.onRender(this.getTime());
//     }
//   }

//   start() {
//     // update the countdown
//     this.update();

//     //  setup a timer
//     const intervalId = setInterval(() => {
//       // update the timer
//       this.timeRemaining -= 1000;

//       if (this.timeRemaining < 0) {
//         // call the callback
//         complete();

//         // clear the interval if expired
//         clearInterval(intervalId);
//       } else {
//         this.update();
//       }
//     }, 1000);
//   }
// }
// import moment from "moment";

// export const timeLeftBeforeArrival = (expectedTimeOfArrival) => {
//   const timeNow = moment.utc(expectedTimeOfArrival * 1000);
//   console.log(timeNow.fromNow());
//   return timeNow.fromNow();
// };

// export const setTimeBeforeArrivalOnPage = () => {
//   const countdown = document.getElementById("countdown");
//   if (countdown) {
//     countdown.innerHTML = timeLeftBeforeArrival(1618359326);
//   }
// };

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
  document.getElementById("timeLeft").innerHTML = timeValue;
};

// const decrementTime = () => {
//   if (time > 0) {
//     time--;
//   } else {
//     clearInterval();
//   }
// };

const countdown = () => {
  const now = Math.floor(Date.now() / 1000);
  let timeLeftMilliseconds = expected_visit_time - now;
  // console.log(now);
  // console.log(expected_visit_time);
  if (timeLeftMilliseconds > -1) {
    let timeLeft = `${getMinutes(timeLeftMilliseconds)}:${getSeconds(
      timeLeftMilliseconds
    )}`;
    setTimeValueInPage(timeLeft);
  }
};

// const approximateTimeLeftWithMoment = () => {
//   const expectedTime = Moment.utc(123445);
//   let timeLeft = expectedTime.fromNow();
//   setTimeValueInPage(timeLeft);
// }

export { countdown };
