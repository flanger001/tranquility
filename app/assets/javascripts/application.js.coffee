#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require turbolinks
#= require underscore

$(document).on 'page:load page:restore ready', ->
  $('.flash')
    .fadeOut 1000, ->
      $(@).remove()

  # Mailchimp email signup form
  $('form[name="mc-embedded-subscribe-form"]').on 'submit', ->
    $('#mailchimp-signup').modal 'hide'

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $(document).on 'change', '[name="change_password"]', ->
    $('.password-form').slideToggle()
