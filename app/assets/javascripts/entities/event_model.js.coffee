@App.module "Entities", (Entities, App) ->
  class Entities.Event extends Backbone.Model
    initialize: ->
      schema = new Backbone.Schema(this)

      schema.define "duration", 
        setter: (attribute, value) ->
          if value.isMoment?()
            return value
          else
            return duration: moment.duration(value, "hours")

    toJSON: ->
      {
        title: @get("title")
        duration: @get("duration").asHours()
      }