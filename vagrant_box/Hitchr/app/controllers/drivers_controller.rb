class DriversController < ApplicationController
  def create
      driver = Driver.new(first_name: params[:driver_first_name], last_name: params[:driver_last_name], email: params[:driver_email], gender: params[:driver_gender], birthday: params[:driver_birthday], password: params[:driver_password], password_confirmation: params[:driver_password_confirmation])
      if driver.valid?
          driver.save
          flash[:notices] = ["You have successfully registered as a Driver!"]
          redirect_to "/sessions/new"
      else
          flash[:errors] = driver.errors.full_messages
          redirect_to "/"
      end
  end

  def show
      render "/drivers/show.html.erb"
  end

  def edit
  end

  def update
  end
end
