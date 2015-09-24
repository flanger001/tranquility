#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require turbolinks
#= require 'underscore'

$(document).on 'page:load ready', ->
  $('.flash')
    .fadeOut 2000, ->
      $(@).remove()

  # Category panels
  categories =
    'skin': ['facials', 'peels', 'organic'],
    'body-treatments': ['wraps', 'scrubs', 'exfoliating'],
    'staff': ['christina-lower', 'jill-stephens', 'kim-cudlin', 'julie-rose', 'kim-mccallum', 'carissa-miller', 'caitlin-kelce']

  initialize_page = (list) ->
    Object.keys(list).forEach (val, idx, ary) ->
      list[val].forEach (val2, idx2, ary2) ->
        if idx2 > 0 then $('#' + val2).hide()

  category_item_selector = (list, target) ->
    category = $(target).data('category')
    item = $(target).data('showTarget')
    categories[category].forEach (val, idx, ary) ->
      if val != item then $('#' + val).hide() else $('#' + val).show()

  initialize_page _(categories).pick('skin', 'body-treatments')

  $('.category-panel').on 'click', 'a', ->
    category_item_selector(categories, this)

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
