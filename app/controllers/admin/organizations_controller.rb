class Admin::OrganizationsController < ApplicationController
  def index
    @companies = Company.all 
    # render admin_technologies_path
  end


  private
  
end
