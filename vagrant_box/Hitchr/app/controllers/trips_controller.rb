class TripsController < ApplicationController
  def create
      trip = Trip.new(a_city: params[:a_city], a_state: params[:a_state], a_zipcode: params[:a_zipcode], b_city: params[:b_city], b_state: params[:b_state], b_zipcode: params[:b_zipcode], date: params[:date], price: params[:price], driver: current_driver, rider: nil)
      if trip.valid?
          trip.save
          flash[:notices] = ["You have successfully added a new TRIP!"]
          redirect_to "/drivers/#{current_driver.id}/index"
      else
          flash[:errors] = driver.errors.full_messages
          redirect_to "/trips/new"
      end
  end

  def show
  end

  def edit
      @trip = Trip.find(params[:id])
      render "/trips/edit.html.erb"
  end

  def update
      trip = Trip.find(params[:id])
      trip.a_city = params[:a_city]
      trip.a_state = params[:a_state]
      trip.a_zipcode = params[:a_zipcode]
      trip.b_city = params[:b_city]
      trip.b_state = params[:b_state]
      trip.b_zipcode = params[:b_zipcode]
      trip.date = params[:date]
      trip.price = params[:price]
      if trip.valid?
          trip.save
          flash[:notices] = ["You have successfully updated the trip info!"]
          redirect_to "/drivers/#{current_driver.id}/index"
      else
          flash[:errors] = trip.errors.full_messages
          redirect_to "/trips/#{params[:id]}/edit"
      end
  end

  def destroy
      Trip.find(params[:id]).destroy
      flash[:notices] = ["You have successfully deleted the trip!"]
      redirect_to "/drivers/#{current_driver.id}"
  end
end
