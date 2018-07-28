class Admin::NewsController < ApplicationController
  def index
    @news_sources = NewsSource.all
  end
end
