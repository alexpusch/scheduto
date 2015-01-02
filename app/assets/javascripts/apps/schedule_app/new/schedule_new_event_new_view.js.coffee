#= require apps/schedule_app/new/templates/schedule_new_event_new_template

@App.module "Schedule.New", (New, App) ->
  class New.NewEventFormView extends Marionette.ItemView
    template: JST["apps/schedule_app/new/templates/schedule_new_event_new_template"]

    ui:
      title: ".title input"
      duration: ".duration input"
      submit: ".submit"

    events: 
      "click @ui.submit": "onSubmitClick"

    onSubmitClick: ->
      #validation...
      
      @trigger "submit:click", @serialize()

    serialize: ->
      title = @ui.title.val()
      durationNumber = parseInt @ui.duration.val(), 10
      duration = moment.duration durationNumber, "hours"

      {title, duration}
