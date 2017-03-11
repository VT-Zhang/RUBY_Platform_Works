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

  def show
      @dojo = Dojo.find(params[:id])
  end

  def edit
      @dojo = Dojo.find(params[:id])
  end

  def update
      @dojo = Dojo.find(params[:id])
      @dojo.branch = params[:branch]
      @dojo.street = params[:street]
      @dojo.city = params[:city]
      @dojo.state = params[:state]
      if @dojo.valid?
          @dojo.save
          flash[:errors] = ["The dojo has been updated successfully!"]
          redirect_to '/dojos'
      else
          flash[:errors] = @dojo.errors.full_messages
          redirect_to "/dojos/"+(@dojo.id).to_s+"/edit"
      end
  end

  def destroy
      dojo = Dojo.find(params[:id])
      dojo.destroy
      redirect_to "/dojos"
  end
end
