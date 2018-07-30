class Admin::TechnologiesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  
  def index
    @technologies = Tag.all 
    # render admin_technologies_path
    @technology = Tag.new
  end

  def create
    @technology = Tag.new technology_params
    # redirect_to admin_technologies_path

    respond_to do | format |
      if @technology.save
        format.html {
          redirect_to admin_technologies_path
          flash[:success] = "Tech tag saved"
        }
        format.js
        format.json { render json: @technology, status: :created, location: @technology }
      else
        format.html { redirect_to admin_technologies_path }
        format.json { render json: @technology.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @technology = Tag.find(params[:id])

    @technology.destroy
    # redirect_to admin_news_index_path

    respond_to do | format |
    format.html { redirect_to admin_technologies_path }
    format.json { head :no_content }
    format.js   { render :layout => false }
    end
  end

  private
  def technology_params
    params.require(:tag).permit(:name)
  end
  
end
