class DirectoriesController < ApplicationController
    def index

        @filterrific = initialize_filterrific(
            Company,
            params[:filterrific],
            select_options: {
                with_tag: Tag.options_for_select,
                with_team_size: Company.team_size_to_select
            },
            :persistence_id => false
        ) or return
        @companies = @filterrific.find.page(params[:page])
        @hash = Gmaps4rails.build_markers(@companies) do |company, marker|
            marker.lat company.latitude
            marker.lng company.longitude
            marker.title company.name
        end
        respond_to do |format|
            format.html
            format.js

        end
    end

end
