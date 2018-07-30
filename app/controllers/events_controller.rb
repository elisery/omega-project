class EventsController < ApplicationController

    def index
        if (params['start_date'])
            fetch_meetup_events(params['start_date'])
        else
            d = Time.now.strftime("%Y-%m-%d")
            fetch_meetup_events(d)
        end
        @events = Event.all
        @events = Event.order(date: :desc)        

        if params['search']
            @query = params['search']
            @meetups = Event.where('lower(title) LIKE ?', "%#{@query.downcase}%")
        end
    end

    private
    def fetch_meetup_events(start_date)
        page_count = '10'
        search_text = 'tech'
        cat = 'education'
        start_date_time = start_date+'T00%3A00%3A00'
        url = "https://api.meetup.com/find/upcoming_events?photo-host=public&start_date_range=#{start_date_time}&page=20&text=#{search_text}&topic_category=#{cat}&page=#{page_count}&key=68693b7c233c3249e5b3e4c6cdc66"
        puts url
        response = HTTParty.get(url)
        res_body = JSON.parse response.body
        events = res_body['events']
        puts 'Coming Here'
        puts events
        events.each do |e|
            mg = MeetupGroup.create(
                name: e['group']['name']
            )
            event = Event.create(
                title: e['name'],
                date: e['local_date'],
                event_url: e['link'],
                time: e['local_time'],
                meetup_group_id: mg.id,
                start_time: DateTime.parse("#{e['local_date']} #{e['local_time']}+00:00")
            )
        end 
    end

end

