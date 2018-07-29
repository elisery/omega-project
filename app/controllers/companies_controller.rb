class CompaniesController < ApplicationController

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

    def company_params
        params.require(:company).permit(:name, :address, :overview, :number_employees, :tech_team_size, :website_url, :twitter, :logo_url, :manager, tag_ids: [])
    end
end
