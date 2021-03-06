#= require jquery-fileupload/basic
#= require spin

$ ->
  request_url = $("#attachable_url").val()

  spinner = new Spinner().spin()
  $('#fileupload').fileupload
    method: "PUT"
    send: ->
      spinner.spin $("#attachments-controls")[0]
      $("#attachments *").attr disabled: true
      $("#fileupload").attr disabled: true
      $("#attachments-controls").css opacity: 0.5

    done: (e, data) ->
      $.get request_url, (attachments_view) ->
        $('#attachments').html attachments_view
        spinner.stop()
        $("#fileupload").attr disabled: false
        $("#attachments-controls").css opacity: 1


  $("#attachments").on "click", ".delete", ->
    el = $(this).parents(".attachment")
    spinner.spin el[0]
    el.css opacity: 0.5
    el.find("*").attr disabled: true
    $.ajax
      method: "DELETE"
      url: $(this).attr "href"
      success: -> el.remove()
    false

  $("#attachments").sortable
    axis: "y"
    cancel: "input,textarea,button,select,option,a"
    distance: 5
    update: ->
      $.post "#{request_url}/reposition", positions: ($("#attachments > *").map -> $(this).data "attachment-id").toArray()

  $("#attachments").disableSelection()
