$(document).ready(function() {

  $('.genderize').blur(function() {

    var text = $(this).val();

    $.ajax({
      url: `https://api.genderize.io/?name=${text}`
    })
    .done(function(data) {
      var gender = data.gender;

      if (gender === 'male') {
        $('.genderize_target').dropdown('set value', 'male');
        $('.genderize_target').dropdown('set selected', 'male');
        console.log('male');
      }

      if (gender === 'female') {
        $('.genderize_target').dropdown('set value', 'female');
        $('.genderize_target').dropdown('set selected', 'female');
        console.log('female');
      }

    });
  });

});
