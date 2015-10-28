$ ->
  $('#newLessonModal').on 'show.bs.modal', (event)->
    formUrl = $(event.relatedTarget).data('lesson-url')
    $(this).find('form').attr('action', formUrl)
