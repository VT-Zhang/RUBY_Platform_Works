class CarsController < ApplicationController
  def create
      car = Car.new(make: params[:make], model: params[:model], color: params[:color], year: params[:year], mileage: params[:mileage], driver: current_driver)
      if car.valid?
          car.save
          flash[:notices] = ["You have successfully added a new car!"]
          redirect_to "/drivers/#{current_driver.id}/index"
      else
          flash[:errors] = car.errors.full_messages
          redirect_to "/cars/new"
      end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
