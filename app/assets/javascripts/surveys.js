const ready = function() {
  const saveDraft = $('.draft');
  saveDraft.on('click', function(e) {
    e.preventDefault();
    saveDraft.html('Saving...');
    saveDraft.prop("disabled", true);

    $.ajax({
      url: '/answers',
      type: 'post',
      data: $('#intake-survey').serialize() + '&survey_completed=false',
      success: function() {
        saveDraft.html('Saved!');
        saveDraft.prop("disabled", true);

        setTimeout(function() {
          saveDraft.html('Save Draft');
          saveDraft.prop("disabled", false);
        }, 500);
      }
    });
  });

  const submit = $('.submit');
  submit.on('click', function(e) {
    $.ajax({
      url: '/answers',
      type: 'post',
      data: $('#intake-survey').serialize() + '&survey_completed=true',
      success: function() {
        window.location.href = '/scheduler'
      }
    });
  });

  $('[data-toggle="tooltip"]').tooltip();

  if ($('.no-location-preference').is(':checked')) {
    var $inputs = $('#intake-survey-2 input:checkbox');
    $inputs.not($('.no-location-preference')).prop('disabled', true);
  }
  $('.no-location-preference').change(function() {
    var $inputs = $('#intake-survey-2 input:checkbox');
    if($(this).is(':checked')) {
      $inputs.not(this).prop('disabled', true);
    } else {
      $inputs.prop('disabled', false);
    }
  });

  $(document)
    .on('click', '.intake-survey button[type=submit]', function(e) {
      if(
        $('.intake-survey input[type=checkbox]:checked').length === 0 &&
        $('.intake-survey input[type=radio]:checked').length === 0 &&
        $('#major-selection') && !$('#major-selection').val()
      ) {
        e.preventDefault(); //prevent the default action
        $('.form-error').css('visibility', 'visible');
      }
    });
};
document.addEventListener("turbolinks:load", ready);
