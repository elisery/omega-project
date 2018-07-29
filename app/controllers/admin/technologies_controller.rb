class Admin::TechnologiesController < ApplicationController
  def index
    @tag = Tag.all 
  end
end
