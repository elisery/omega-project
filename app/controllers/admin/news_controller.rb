class Admin::NewsController < ApplicationController
  def index
    @news_source = NewsSource.all
  end
  
  def new
    @news_source = NewsSource.new
  end

  def create
    @news_source = NewsSource.new news_params

    if @news.save
      redirect_to admin_news_index_path
    end

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
    params.require(:news).permit(:source)
  end
  
end
