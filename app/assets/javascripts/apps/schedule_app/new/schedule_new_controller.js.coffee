@App.module "Schedule.New", (New, App) ->
  class New.Controller extends Marionette.Controller
    initialize: (@options) ->
      {@schedule, @region} = @options

    start: ->
      layout = new New.Layout
      @region.show layout
      
      eventListView = new New.EventsListView
        collection: @schedule.get("events")

      calendarView = new New.CalendarView
        model: @schedule

      layout.eventsList.show eventListView
      layout.calendar.show calendarView