class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :initResume

  def initResume
    file = File.read('public/json_resume')
    json = JSON.parse(file)

    # Introduction
    intro = json["intro"]
    @basics = Resume.new(intro["name"], intro["label"], intro["image"], intro["email"], intro["phone"], intro["website"], intro["summary"], intro["location"], intro["profiles"])
  end
end
