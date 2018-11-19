require 'clockwork'
require_relative './config/boot'
require_relative './config/environment'

module Clockwork
    handler do |job|
      puts "Running #{job}"
    end
  
    every(1.day, "Update Player Averages", at: "02:00", tz: "PST") do
      CompleteAllSessionsNotEndedProperlyWorker.perform_async
    end
  end