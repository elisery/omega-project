class Admin::EventsController < ApplicationController
  def index
    @meetup_group = MeetupGroup.all
  end

  

end
