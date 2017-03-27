class RidersController < ApplicationController
  def create
      rider = Rider.new(first_name: params[:rider_first_name], last_name: params[:rider_last_name], email: params[:rider_email], gender: params[:rider_gender], birthday: params[:rider_birthday], password: params[:rider_password], password_confirmation: params[:rider_password_confirmation])
      if rider.valid?
          rider.save
          flash[:notices] = ["You have successfully registered as a Rider!"]
          redirect_to "/sessions/new"
      else
          flash[:errors] = rider.errors.full_messages
          redirect_to "/"
      end
  end

  def show
      @rider = Rider.find(params[:id])
    #   @age = @rider.birthday
    #   @age.strftime("%Y")
      render "/riders/show.html.erb"
  end

  def edit
  end

  def update
  end
end
