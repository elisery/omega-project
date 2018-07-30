class Admin::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  
  def index
    @meetup_groups = MeetupGroup.all 
    # render admin_technologies_path
    @meetup_group = MeetupGroup.new
  end



  def create
    @meetup_group = MeetupGroup.new meetup_group_params
    # redirect_to _technologies_path

    # if @meetup_group.save
    #   # render json: params
    #   flash[:success] = "Group saved"
    # else
    #   flash[:error] = "Group already exists"
    # end
    # redirect_to admin_events_path
    respond_to do | format | 
      if @meetup_group.save
        format.html {
          redirect_to admin_events_path
          # flash[:success] = "Group saved"
        }
        format.js 
        # format.js { render 'create.js.erb'} 
        format.json { render json: @meetup_group, status: :created, location: @meetup_group }
      else
        format.html { redirect_to admin_events_path }
        format.json { render json: @meetup_group.errors, status: :unprocessable_entity }
      end

    end
  end

  def destroy
    @meetup_group = MeetupGroup.find(params[:id])

    @meetup_group.destroy
    # redirect_to admin_news_index_path

    respond_to do | format |
    format.html { redirect_to admin_events_path }
    format.json { head :no_content }
    format.js   { render :layout => false }
    end
  end



  private
  def meetup_group_params
    params.require(:meetup_group).permit(:name)
  end

  

end
