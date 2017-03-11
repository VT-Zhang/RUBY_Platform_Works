class DojoControllerController < ApplicationController
  def index
      @dojos = Dojo.all
  end

  def new
  end

  def create
      dojo = Dojo.create(branch: params[:branch], street: params[:street], city: params[:city], state: params[:state])
      if dojo.valid?
          flash[:errors] = ["A new dojo was created successfully!"]
          redirect_to '/dojos'
      else
          flash[:errors] = dojo.errors.full_messages
          redirect_to "/dojos/new"
      end
  end

end
