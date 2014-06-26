$(function() {
    $('.next').click(function() {
        // Calling a function in case you want to expand upon this.
        next();
    });
});

function next() {
    if ($('this').hasClass('show')) {
        $('this').removeClass('show');
        $('this').addClass('hidden');
        if ($('this').hasClass('1')) {
          $('2').removeClass('hidden');
        } else if ($('this').hasClass('2')) {
          $('3').removeClass('hidden');
        } else if ($('this').hasClass('3')) {
          $('4').removeClass('hidden');
        } else {
          $('5').removeClass('hidden');
        }
      }
    }