$ ->
  $('.lessons').sortable
    update: (event, ui)->
      $.ajax
        url: '/instructor/lessons/' + ui.item.data('item-id'),
        type: 'PUT',
        data:
          lesson:
            row_order_position: ui.item.index()

  $('.sections').sortable
    update: (event, ui)->
      $.ajax
        url: '/instructor/sections/' + ui.item.data('item-id'),
        type: 'PUT',
        data:
          section:
            row_order_position: ui.item.index()
