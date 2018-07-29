class Admin::OrganizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  
  def index
    @companies = Company.all 
    # render admin_technologies_path
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do | format |
    format.html { redirect_to admin_organizations_path }
    format.json { head :no_content }
    format.js   { render :layout => false }
    end
  end

  private
  
end
