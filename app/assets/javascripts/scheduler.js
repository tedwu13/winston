$(document).ready(function() {
  $('.scheduler-btn').click(function(e) {
    let method;
    if ($(event.target).attr('class').includes('btn-default')) {
      $.ajax({
        url: '/availabilities',
        type: 'post',
        data: {
          new_availability: e.target.id
        },
      });
    } else {
      $.ajax({
        url: '/availabilities/' + this.id,
        type: 'delete',
        data: {
          new_availability: e.target.id
        },
      });
    }
    $(this).toggleClass('btn-default btn-success');
  });
});
