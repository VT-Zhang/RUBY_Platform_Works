class EventsController < ApplicationController
  def index
      @event_same_state = Event.where(state: session[:state])
      @event_rest = Event.where.not(state: session[:state])
  end

  def create
      event = Event.new(name: params[:name], date: params[:date], location: params[:location], state: params[:state], user: current_user)
      if event.valid?
          event.save
          flash[:notices] = ["You have successfully added an event!"]
          redirect_to "/events"
      else
          flash[:error] = event.errors.full_messages
          redirect_to "/events"
      end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def new
  end

  def show
  end
end
