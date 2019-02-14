const ready = function() {
  console.log("hello");

  const saveDraft = $('.draft');
  saveDraft.on('click', function(e) {
    e.preventDefault();
    saveDraft.html('Saving...');
    saveDraft.prop("disabled", true);

    $.ajax({
      url: '/answers',
      type: 'post',
      data: $('#intake-survey').serialize(),
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
      data: $('#intake-survey').serialize(),
      success: function() {
        window.location.href = '/users/1'
      }
    });
  });
};

$(document).ready(ready);
document.addEventListener("turbolinks:load", ready);