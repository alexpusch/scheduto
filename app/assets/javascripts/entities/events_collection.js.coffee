@App.module "Entities", (Entities, App) ->
  class Entities.Events extends Backbone.Collection
    model: Entities.Event

    url: ->
      "schedules/#{@scheduleId}/events.json"