#= require apps/schedule_app/new/templates/schedule_new_event_item_template

@App.module "Schedule.New", (New, App) ->
  class New.EventItemView extends Marionette.ItemView
    template: JST["apps/schedule_app/new/templates/schedule_new_event_item_template"]
    tagName: "li"
    className: "event-item"