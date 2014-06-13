#= require bootstrap-wysihtml5/b3
#= require brightcontent/wysithtml5-parser-rules
#= require bootstrap-wysihtml5/locales/nl-NL

$ ->
  editorLocale = $('body').data('editorLocale')

  $('[data-wysihtml5]').wysihtml5
    html: true
    locale: editorLocale
    parserRules: wysihtml5ParserRules
    events:
      load: ->
        editor = $("#insertable").data("wysihtml5").editor
        editor.focus()

  $("#attachments").on "click", ".insert_image", (e) ->
    e.preventDefault()
    editor.composer.commands.exec "insertImage",
      src: $(this).data("insertImage")

  $("#attachments").on "click", ".insert_link", (e) ->
    e.preventDefault()
    editor.composer.commands.exec "createLink",
      href: $(this).data("insertUrl")
      target: "_blank"
      rel: "nofollow"
      text: $(this).data("insertName")

  $('[data-behaviour~=datepicker]').datetimepicker(pickTime: false, language: 'nl')
  $('[data-behaviour~=datetimepicker]').datetimepicker(language: 'nl')
