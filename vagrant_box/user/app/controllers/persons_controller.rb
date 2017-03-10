class PersonsController < ApplicationController
  def index
      render json: Person.all
  end

  def new
  end

  def edit
  end

  def create
      Person.create( name: params[:name], age: params[:age])
      redirect_to '/persons/new'
  end

  def show
      @persons = Person.find_by_id(params[:id])
      render json: @persons
  end

  def update
  end

  def destroy
  end

  def total
      session[:total] = Person.count
  end
end
