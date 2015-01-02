#= require apps/schedule_app/new/templates/schedule_new_calendar_template

@App.module "Schedule.New", (New, App) ->
  class New.CalendarView extends Marionette.ItemView
    template: JST["apps/schedule_app/new/templates/schedule_new_calendar_template"]

    ui:
      calendar: ".calendar"

    onShow: ->
      calendar = @initCallendar()
      calendarEvents = @model.createDatedEvents()
      calendar.fullCalendar("addEventSource", calendarEvents);

    initCallendar: ->
      calendar =  @$(".calendar").fullCalendar
        header:
          left: 'prev,next today',
          center: 'title',
          right: 'month,agendaWeek,agendaDay'
        defaultDate: @model.get("startDate")
        defaultView: 'agendaWeek',
        editable: true,
        height: 700


      calendar