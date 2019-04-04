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
};
document.addEventListener("turbolinks:load", ready);
