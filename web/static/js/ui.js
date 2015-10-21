var UI = {
  initAttendanceForm: function() {
    $('.attend>.touch_area').on('click', function(){
      $('.attend').toggleClass('open');
    });
    $('.attend a.close').on('click', function(){
      $('.attend').removeClass('open');
    });
  },
  run: function run() {
    console.log("Hello!");
  }
};

module.exports = UI;