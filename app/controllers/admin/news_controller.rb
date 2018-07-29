class Admin::NewsController < ApplicationController
  def index
    @news_sources = NewsSource.all
    @news_source = NewsSource.new 
  end
  
  def create
    @news_source = NewsSource.new news_source_params

    if @news_source.save
      flash[:success] = "News source saved"
    else
      flash[:error] = "News source already exists"
      
    end
    redirect_to admin_news_index_path
  end

  def destroy
    @news_source = NewsSource.find(params[:id])

    @news_source.destroy
    redirect_to admin_news_index_path

    # respond_to do | format |
    # format.html { redirect_to admin_news_index_path }
    # format.js
  end

  private
  def news_source_params
    params.require(:news_source).permit(:source)
  end
  
end
