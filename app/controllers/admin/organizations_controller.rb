class Admin::OrganizationsController < ApplicationController
  def index
    @company = Company.all
  end
end
