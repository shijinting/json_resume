class ResumeController < ApplicationController
  require 'json'
  def show
    file = File.read('public/json_resume')
    json = JSON.parse(file)

    # Experience
    @experiences = []
    json["experiences"].each do |exp|
      @experiences << Experience.new(exp["category"], exp["company"], exp["position"], exp["website"], exp["year"], exp["summary"], exp["highlights"])
    end

    # Outreach
    @outreaches = []
    json["outreach"].each do |outreach|
      @outreaches << Outreach.new(outreach["eventName"], outreach["role"], outreach["year"], outreach["summary"])
    end

    # Education
    edu = json["education"][0]
    @education = Education.new(edu["institution"], edu["area"], edu["studyType"], edu["startYear"].to_s, edu["endYear"].to_s, edu["gpa"].to_s)

    # Awards
    @awards = []
    json["awards"].each do |award|
      @awards << Award.new(award["title"], award["date"], award["awarder"], award["summary"])
    end

    # Publication
    @publications = []
    json["publications"].each do |pub|
      @publications << Publication.new(pub["name"], pub["publisher"], pub["releaseYear"])
    end

    # Skill
    @skills = []
    json["skills"].each do |skill|
       @skills << Skill.new(skill["name"], skill["level"], skill["keywords"])
    end

    # Language
    @languages = []
    json["languages"].each do |lang|
       @languages << Language.new(lang["name"], lang["level"])
    end

    # Interest
    interest = json["interests"][0]
    @interest = Interest.new(interest["name"], interest["keywords"])

    # Reference
    refer = json["references"][0]
    @references = Reference.new(refer["name"], refer["reference"], refer["contact"])
  end
end
