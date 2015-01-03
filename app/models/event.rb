class Event
  include Mongoid::Document
  field :title, type: String
  field :duration, type: Integer

  embedded_in :schedule
end
