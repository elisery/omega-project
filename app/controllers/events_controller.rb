class EventsController < ApplicationController
    def index
        # @events = Event.order(date: :desc)
        @events = Event.all      
    end
end

