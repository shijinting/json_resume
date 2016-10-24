class Skill
  attr_accessor :name, :level, :keywords

   # constructor method
   def initialize(name, level, keywords)
      @name = name
      @level = level
      @keywords = keywords
   end
end
