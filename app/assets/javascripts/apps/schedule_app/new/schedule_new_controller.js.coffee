@App.module "Schedule.New", (New, App) ->
  class New.Controller extends Marionette.Controller
    initialize: (@options) ->
      {@schedule, @region} = @options

    start: ->
      layout = new New.Layout
      @region.show layout
      
      eventListView = @getEventsListView()
      newEventFormView = @getEventNewFormView()
      calendarView = @getCalendarView()

      @listenToEventNewForm newEventFormView

      @showViews layout, eventListView ,calendarView ,newEventFormView

    getEventsListView: ->
      new New.EventsListView
        collection: @schedule.get("events")

    getEventNewFormView: ->
      new New.NewEventFormView

    getCalendarView: ->
      new New.CalendarView
        model: @schedule

    listenToEventNewForm: (newEventFormView) ->
      @listenTo newEventFormView, "submit:click", (serializedEvent) ->
        event = new App.Entities.Event serializedEvent
        @schedule.get("events").add event

    showViews: (layout, eventListView, calendarView, newEventFormView) ->
      layout.eventsList.show eventListView
      layout.calendar.show calendarView
      layout.newEventForm.show newEventFormView