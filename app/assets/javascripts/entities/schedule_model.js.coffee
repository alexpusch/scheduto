@App.module "Entities", (Entities, App) ->
  class Entities.Schedule extends Backbone.Model
    initialize: ->
      schema = new Backbone.Schema(this)

      schema.define "events",
        collection: App.Entities.Events

      schema.define "startDate", 
        setter: (attribute, value) ->
          if value.isMoment?()
            return value
          else
            return start: moment(value)

      @get("events").scheduleId = @get("id")

    createDatedEvents:  ->
      events = @get("events").models
      instantiatedEvents = []

      if events?
        currentDate = @get "startDate"
        
        for event in events
          currentEventStart = currentDate

          currentEventEnd = moment(currentEventStart).add(event.get("duration"))

          instantiatedEvents.push
            title: event.get("title")
            start: currentEventStart
            end: currentEventEnd

          currentDate = currentEventEnd

      instantiatedEvents