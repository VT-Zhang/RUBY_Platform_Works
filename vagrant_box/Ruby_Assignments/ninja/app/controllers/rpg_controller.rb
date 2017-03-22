class RpgController < ApplicationController

  def index
      if session[:money] == nil
         session[:money] = 0
         session[:log] = ""
      end
      render 'rpg/index.html.erb'
  end


  def farm
      gold = rand(10..20)
      time = (DateTime.now).strftime "%m/%d/%Y %I:%M %p"
      session[:money] += gold
      session[:log] += "You earned $#{gold} golds at the FARM ... #{time} \n"
      redirect_to '/'
  end

  def cave
      gold = rand(5..10)
      time = (DateTime.now).strftime "%m/%d/%Y %I:%M %p"
      session[:money] += gold
      session[:log] += "You earned $#{gold} golds at the CAVE ... #{time} \n"
      redirect_to '/'

  end

  def house
      gold = rand(2..5)
      time = (DateTime.now).strftime "%m/%d/%Y %I:%M %p"
      session[:money] += gold
      session[:log] += "You earned $#{gold} golds at the HOUSE ... #{time} \n"
      redirect_to '/'
  end

  def casino
      gold = rand(-50..50)
      time = (DateTime.now).strftime "%m/%d/%Y %I:%M %p"
      session[:money] += gold
      if gold < 0
          gold = gold * -1
          session[:log] += "You lost $#{gold} gold at the CASINO! #{time} \n"
      else
          session[:log] += "You earned $#{gold} gold at the CASINO... #{time} \n"
      end
      redirect_to '/'
  end

  def reset
      reset_session
      redirect_to '/'
  end
end
