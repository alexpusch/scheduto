class MainController < ApplicationController
  def index
    gon.schedule = Schedule.first
  end
end
