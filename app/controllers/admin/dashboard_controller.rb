class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  private
  def authorize_admin!
    unless current_user.admin?
      flash[:danger] = "Access Denied"
      redirect_to home_path
    end
  end
  helper_method(:authorize_admin!)
end
