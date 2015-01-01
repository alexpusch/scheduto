# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@App = new Marionette.Application()

@App.regions = 
  main: new Marionette.Region
    el: "#main"

@App.on "start", ->
  console.log "after init"
  Backbone.history.start()
