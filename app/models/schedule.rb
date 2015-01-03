class Schedule
  include Mongoid::Document
  field :startDate, type: Date

  embeds_many :events
end
