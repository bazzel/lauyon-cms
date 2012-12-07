#= require jquery.masonry

$ ->
  $container = $('#partners')
  $container.imagesLoaded ->
    $container.masonry
      itemSelector: 'li'
      columnWidth: (containerWidth) ->
        containerWidth / 4
