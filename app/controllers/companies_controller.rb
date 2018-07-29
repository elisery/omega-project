class CompaniesController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_user!, only: [:new, :create, :edit, :update, :destroy]

    def new
        @company = Company.new
    end
   
    def create
        @company = Company.new company_params
        # @company.user = current_user

        if @company.save
            redirect_to company_path(@company.id)
        else
            render :new
        end
    end

    def show
        @company = Company.find params[:id]
    end

    def edit
        @company = Company.find params[:id]
    end

    def update
        if @company.update(company_params)
            redirect_to admin_organizations_path
          else
            render :edit
        end
    end

    def destroy
        @company.destroy
        redirect_to admin_organizations_path
    end

    def company_params
        params.require(:company).permit(:name, :address, :overview, :number_employees, :tech_team_size, :website_url, :twitter, :logo_url, :manager, :published, tag_ids: [])
    end
end
