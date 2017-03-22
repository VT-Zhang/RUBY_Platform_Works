class DojoControllerController < ApplicationController
  def index
      @dojos = Dojo.all
  end
end
