class EventsController < ApplicationController
    def index
        # @events = Event.order(date: :desc)
        @events = Event.all
        @meetups = fetch_meetup_events
    end

    private

    def fetch_meetup_events
        params = {
            category: '1',
            city: 'Vancouver',
            country: 'CA',
            status: 'upcoming',
            format: 'json',
            page: '10'
        }

        meetup_api = MeetupApi.new
        
        events = meetup_api.open_events(params)
        
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
end

