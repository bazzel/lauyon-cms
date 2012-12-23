$ ->
  $('.menu-button').click (e) ->
    $(@).parent().find('ul').toggle()
    e.preventDefault()

