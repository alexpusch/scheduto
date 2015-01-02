@App.module "Schedule.New", (New, App) ->
  class New.EventsListView extends Marionette.CollectionView
    childView: New.EventItemView
    tagName: "ul"
    className: "event-list"