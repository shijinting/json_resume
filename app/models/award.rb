class Award
  attr_accessor :title, :date, :awarder, :summary

   # constructor method
   def initialize(title, date, awarder, summary)
      @title = title
      @date = date
      @awarder = awarder
      @summary = summary
   end
end
