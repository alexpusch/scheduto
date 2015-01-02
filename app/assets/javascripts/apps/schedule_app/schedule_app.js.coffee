@App.module "Schedule", (Schedule, App) ->
  class Schedule.Router extends Backbone.Marionette.AppRouter
    appRoutes:
      "schedule/new": "new"

  schedule = new App.Entities.Schedule
    startDate: moment("2015-01-01T08:00Z")
    events: new App.Entities.Events [
      new App.Entities.Event
        title: "event 1"
        duration: moment.duration(1, "hours")
    ,
      new App.Entities.Event
        title: "event 2"
        duration: moment.duration(2, "hours")
    ,
      new App.Entities.Event
        title: "event 3"
        duration: moment.duration(1, "hours")
    ]

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
