class DirectoriesController < ApplicationController
    def index
        @search_term = ""
        if params['search_text']
            @search_term = params['search_text']
            puts @search_term
            @tag = Tag.where('lower(name) = ?', @search_term.downcase).first
            if @tag
                @search_companies = @tag.companies.order(created_at: :asc)
                if @search_companies
                    @tags = []
                    @team_size = [0, 101, 501, 1001, 5001, 10001, 50001, 100001, 500001]
                    @max_team_size = 0;
                    @search_companies.each do |c|
                        @tags = @tags + c.tags
                        puts c.tech_team_size
                        @max_team_size = if @max_team_size < c.tech_team_size then c.tech_team_size else @max_team_size end
                    end
                    puts @tags
                    @team_size_abs = @team_size.select { |s| s <= @max_team_size }
                    @team_size_abs.push(@team_size[@team_size_abs.length])
                    @team_size_arr = []
                    i = 0
                    @team_size_abs.each_index { |index|
                        if index < (@team_size_abs.length-1)
                            @team_size_arr.push("#{@team_size_abs[index]}-#{@team_size_abs[index+1]-1}")
                        end
                    }
                    puts @team_size_arr
                end
            end
        end
    end
end
