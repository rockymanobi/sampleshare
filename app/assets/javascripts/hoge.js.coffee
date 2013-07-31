$ ->
  load = ->
    $.getJSON('/proc/load_mark_down')
    .done (data)->
      mark = $('#markdown')
      mark.val( data.hoge )
    .fail (data)->
      alert 'ng'

  load()

  $('#load-btn').on 'click', ->
    load()

  $('#preview-btn').on 'click', ->
    current_page_path = preview.location.href

    $.post("/proc/refresh_slide", { id: "", text: $('#markdown').val() } )
    .done (data)->
      preview.location.reload(true)
      preview.location.href = current_page_path
      
    .fail (data)->
      alert 'ng'


