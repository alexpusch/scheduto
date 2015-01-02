#= require apps/schedule_app/new/templates/schedule_new_layout_template

App.module "Schedule.New", (New, App) ->
  class New.Layout extends Marionette.LayoutView
    template: JST["apps/schedule_app/new/templates/schedule_new_layout_template"]
    regions:
      eventsList: ".events-list"
      newEventForm: ".new-event-form"
      calendar: ".calendar-container"
