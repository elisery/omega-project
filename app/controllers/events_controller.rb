class EventsController < ApplicationController

    def index
        @events = Event.all
        @events = Event.order(date: :desc)
        @meetups = fetch_meetup_events
        # @events = MeetupApi.search(params[:text])
    

        if params[:search]
          @events = Event.search(params[:search]).order("created_at DESC")
        else
          @events = Event.all.order('created_at DESC')
        end
    end

    private

    def fetch_meetup_events
        api_params = {
            category: '1',
            city: 'Vancouver',
            country: 'CA',
            status: 'upcoming',
            format: 'json',
            page: '10',
            text: 'work', #api search term
        }

        meetup_api = MeetupApi.new
        events = meetup_api.open_events(api_params)
        
        if events['results'].present?
            events['results']
        else
            []
        end
    end

    def create_event
        Event.new(
            title: e['name'],
            date: Time.at(e['time'] / 1000).to_date,
            event_url: e["event_url"],
            time: Time.at(e['time'] / 1000).strftime("%I:%M%P"),
            meetup_group_id: 1,
            start_time: Time.at(e['time'] / 1000)
        )
    end

    def event_params
        params.require(:event).permit(:title, :date, :event_url, :time, :meetup_group_id, :start_time, :search)
      end
end

