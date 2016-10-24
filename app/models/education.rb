class Education
  attr_accessor :institution, :area, :studyType, :startYear, :endYear, :gpa

   # constructor method
   def initialize(institution, area, studyType, startYear, endYear, gpa)
      @institution = institution
      @area = area
      @studyType = studyType
      @startYear = startYear
      @endYear = endYear
      @gpa = gpa
   end
end
