// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
    $('.search.form input').focus(function(e) {
        $('.autocomplete.drawer').slideDown(500);
    });

    $('.search.form input').focusout(function(e) {
        $('.autocomplete.drawer').slideUp(300);
    });

    typable()
});

//function typable(prefix, suffix) {
//    var prefix = prefix || '';
//    var suffix = suffix || '';
//
//    var placeholder = $(document).find("[data-dynamic-placeholder='true']").attr('placeholder');
//
//    var lines = ['Vintage dresser', '1998 Vespa', 'Victorian silverware'];
//
//    $.each(lines, function(i, line) {
//        type(line);
//    });
//
//    function sleep(milliseconds) {
//        var start = new Date().getTime();
//        for (var i = 0; i < 1e7; i++) {
//            if ((new Date().getTime() - start) > milliseconds){
//                break;
//            }
//        }
//    }
//
//    function type(text, delay=100) {
//        $.each(text.split(''), function(i, letter) {
//
//            setTimeout(function() {
//                console.log(letter);
//            }, delay*i );
//
//        });
//    }
//}
