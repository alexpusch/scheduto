@App.module "Entities", (Entities, App) ->
  class Entities.Schedule extends Backbone.Model
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