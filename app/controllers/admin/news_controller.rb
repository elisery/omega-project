class Admin::NewsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  
  def index
    @news_sources = NewsSource.all
    @news_source = NewsSource.new 
  end
  
  def create
    @news_source = NewsSource.new news_source_params

    respond_to do | format | 
      if @news_source.save
        format.html {
          redirect_to admin_news_index_path
          flash[:success] = "News source saved"
        }
        format.js
        format.json { render json: @news_source, status: :created, location: @news_source }
      else
        format.html { redirect_to admin_news_index_path }
        format.json { render json: @news_source.errors, status: :unprocessable_entity }
      end

    end

    # if @news_source.save
    #   flash[:success] = "News source saved"
    # else
    #   flash[:error] = "News source already exists"
      
    # end
    # redirect_to admin_news_index_path
  end

  def destroy
    @news_source = NewsSource.find(params[:id])

    @news_source.destroy
    # redirect_to admin_news_index_path

    respond_to do | format |
    format.html { redirect_to admin_news_index_path }
    format.json { head :no_content }
    format.js   { render :layout => false }
    end
  end

  # def destroy
  #   @pony = Pony.find(params[:id])
  #   @pony.destroy

  #   respond_to do |format|
  #     format.html { redirect_to ponies_url }
  #     format.json { head :no_content }
  #     format.js   { render :layout => false }
  #   end
  # end

  private
  def news_source_params
    params.require(:news_source).permit(:source)
  end
  
end
