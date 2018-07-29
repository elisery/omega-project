class Admin::EventsController < ApplicationController

  def index
    @meetup_groups = MeetupGroup.all 
    # render admin_technologies_path
    @meetup_group = MeetupGroup.new
  end



  def create
    @meetup_group = MeetupGroup.new meetup_group_params
    # redirect_to admin_technologies_path

    if @meetup_group.save
      # render json: params
      flash[:success] = "Group saved"
    else
      flash[:error] = "Group already exists"
    end
    redirect_to admin_events_path
  end

  private
  def meetup_group_params
    params.require(:meetup_group).permit(:name)
  end

  

end
