class Resume
  attr_accessor :name, :label, :email, :phone, :website, :summary, :location, :profiles

   # constructor method
   def initialize(name, label, email, phone, website, summary, location, profiles)
      @name = name
      @label = label
      @email = email
      @phone = phone
      @website = website
      @summary = summary
      @location = location
      @profiles = profiles
   end

end
