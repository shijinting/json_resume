class ResumeController < ApplicationController
  require 'json'
  require 'rest_client'
  require 'open-uri'
  def new

  end

  def create
    jsonFile = params[:resume][:jsonFile]
    unless jsonFile.nil?
      response = RestClient.post 'http://cyberweb.my/shijin/uploadJsonResume.php', {:resume => jsonFile, :multipart => true, :accept => :json}
      json_response = JSON.parse(response)
    end

    if response.nil?
      redirect_to root_path, :flash => { :alert => "Please upload json file" }
    else
      if json_response["success"] == 1
        redirect_to resume_path(jsonFile.original_filename.partition('.').first)
      else
        redirect_to root_path, :flash => { :alert => json_response["message"] }
      end
    end
  end

  def show
    fileName = params[:id]
    json = JSON.parse open('http://cyberweb.my/shijin/resume/' + fileName).read

    # Introduction
    intro = json["intro"]
    @basics = Resume.new(intro["name"], intro["label"], intro["image"], intro["email"], intro["phone"], intro["website"], intro["summary"], intro["location"], intro["profiles"])

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
