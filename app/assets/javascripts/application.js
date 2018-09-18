//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks

$(document).on( 'page:load page:restore ready', function(e) {
  $('.flash').fadeOut(1000, function(e) {
    $(this).remove();
  });

  // Mailchimp email signup form
  $('form[name="mc-embedded-subscribe-form"]').on('submit', function(e) {
    $('#mailchimp-signup').modal('hide');
  });

  $('form').on('click', '.add_fields', function(e) {
    var time = new Date().getTime();
    var regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    event.preventDefault();
  });

  $(document).on('change', '[name="change_password"]', function(e) {
    $('.password-form').slideToggle()
  })
});
