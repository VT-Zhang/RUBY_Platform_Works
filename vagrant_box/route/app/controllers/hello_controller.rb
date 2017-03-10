class HelloController < ApplicationController
  def index
      session[:counter] = 0
  end

  def haha
      redirect_to "/say/hello/joe"
  end

  def say
      puts "What do you want me to say?"
  end

  def time
      if session[:counter] = nil
          session[:counter] = 1
      else
          session[:counter] += 1
      end
  end
end
