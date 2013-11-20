# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    event.preventDefault()
    $(this).prev().children().val('true')
    $(this).closest('fieldset').hide('slow')


  $('form').on 'click', '.add_fields', (event) ->
    event.preventDefault()
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    $(this).prev().children().children('.div-content').attr('id',Math.random())

#    $(this).prev().children('.div-content').CKEDITOR
    CKEDITOR.inline($(this).prev().children().children('.div-content').attr('id'))
#    CKEDITOR.inline($(this).prev().children().children('.div-content'))
#    alert('.' + $(this).prev().children().children('.div-content').attr('id'))


  $('.div-content').each ->
    $(this).append($(this).prev().children().val())

  $('input[type=submit]').on 'click', ->
    $('.div-content').each ->
      $(this).prev().children().val($(this).html())



