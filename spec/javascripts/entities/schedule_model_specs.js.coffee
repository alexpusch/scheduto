describe "Entities.Schedule", ->
  beforeEach ->
    jasmine.addMatchers
      toBeSameMoment: ->
        compare: (actual, expected) ->
          result = {}
          unless actual.isMoment?() && expected.isMoment?()
            result.pass = false
            result.message = "actual and expected values must be moment objects"

          if actual.isSame(expected)
            result.pass = true
          else
            result.pass = false
            result.message = "expected #{actual.toISOString()} to be the same moment as #{expected.toISOString()}"

          result

  describe "createDatedEvents", ->
    describe "schedule with no events", ->
      it "returns an empty array", ->
        schedule = new App.Entities.Schedule
          startDate: moment("2015-01-01T08:00Z")
          events: []

        expect(schedule.createDatedEvents()).toEqual []

    describe "schedule with some events", ->
      beforeEach ->
        @schedule = new App.Entities.Schedule
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

        @timedEvents = @schedule.createDatedEvents()

      it "creates the first event with the schedule start time", ->
        expect(@timedEvents[0].start).toBeSameMoment(moment("2015-01-01T08:00Z"))

      it "assings the events end to be after the event duration", ->
        expect(@timedEvents[0].end).toBeSameMoment(moment("2015-01-01T09:00Z"))

      it "assings the second event the start time of the first event end", ->
        expect(@timedEvents[1].start).toBeSameMoment(moment("2015-01-01T09:00Z"))        