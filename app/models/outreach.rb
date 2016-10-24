class Outreach
  attr_accessor :eventName, :role, :year, :summary

   # constructor method
   def initialize(eventName, role, year, summary)
      @eventName = eventName
      @role = role
      @year = year
      @summary = summary
   end
end
