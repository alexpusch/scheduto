#= require apps/schedule_app/new/templates/schedule_new_calendar_template

@App.module "Schedule.New", (New, App) ->
  class New.CalendarView extends Marionette.ItemView
    template: JST["apps/schedule_app/new/templates/schedule_new_calendar_template"]
