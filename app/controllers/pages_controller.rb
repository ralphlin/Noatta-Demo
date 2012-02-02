class PagesController < ApplicationController
  def home
  	@title = "Home"
  end

  def contact
  	@title = "Contact"
  end

  def about
  	@title = "About"
  end

  def help
  	@title = "Help"
  end

  def clientdemo
    @title = "Client Demo"
  end

  def serverdemo
    @title = "Server Demo"
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end   
  end

  def checkin
    @title = "Check In"
  end

  def payment
    @title = "Payment"
  end

end
