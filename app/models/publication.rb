class Publication
  attr_accessor :name, :publisher, :releaseYear

   # constructor method
   def initialize(name, publisher, releaseYear)
      @name = name
      @publisher = publisher
      @releaseYear = releaseYear
   end
end
