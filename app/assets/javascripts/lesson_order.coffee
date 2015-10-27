$ ->
  $('.lessons').sortable
    update: (event, ui)->
      $.ajax
        url: '/instructor/lessons/' + ui.item.data('item-id'),
        type: 'PUT',
        data:
          lesson:
            row_order_position: ui.item.index()
