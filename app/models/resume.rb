class Resume
  attr_accessor :name, :label, :image, :email, :phone, :website, :summary, :location, :profiles

   # constructor method
   def initialize(name, label, image, email, phone, website, summary, location, profiles)
      @name = name
      @label = label
      @image = image
      @email = email
      @phone = phone
      @website = website
      @summary = summary
      @location = location
      @profiles = profiles
   end

end
