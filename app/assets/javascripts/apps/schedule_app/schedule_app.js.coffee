@App.module "Schedule", (Schedule, App) ->
  class Schedule.Router extends Backbone.Marionette.AppRouter
    appRoutes:
      "schedule/new": "new"

  schedule = new App.Entities.Schedule gon.schedule
  window.schedule = schedule

  API = 
    new: ->
      console.log "new schedule route"
      controller = new Schedule.New.Controller
        schedule: schedule
        region: App.regions.main

      controller.start()

  App.on "before:start", ->
    console.log "schedule app start"

       
    new Schedule.Router 
      controller: API
