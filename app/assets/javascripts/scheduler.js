$(document).ready(function() {
  $('.scheduler-btn').click(function(e) {
    $(this).toggleClass('btn-default btn-success');
    $.ajax({
      url: '/availabilities',
      type: 'post',
      data: {
        new_availability: e.target.id
      },
    });
  });
});
