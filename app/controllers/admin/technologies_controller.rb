class Admin::TechnologiesController < ApplicationController
  def index
    @technologies = Tag.all 
    # render admin_technologies_path
    @technology = Tag.new
  end



  def create
    @technology = Tag.new technology_params
    # redirect_to admin_technologies_path

    if @technology.save
      # render json: params
      flash[:success] = "Tag created"
    else
      flash[:error] = "Tag already exists"
    end
    redirect_to admin_technologies_path
  end

  private
  def technology_params
    params.require(:tag).permit(:name)
  end
  
end
