class Experience
  attr_accessor :category, :company, :position, :website, :year, :summary, :highlights

   # constructor method
   def initialize(category, company, position, website, year, summary, highlights)
      @category = category
      @company = company
      @position = position
      @website = website
      @year = year
      @summary = summary
      @highlights = highlights
   end
end
