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
    @foundID
  end

  def payment
    @title = "Payment"
  end

  def bank_accounts
    if signed_in?
      @user = current_user
    end
    @title = "Bank Accounts"
  end

  def merchants
    @title = "Merchants"
    if signed_in?
      @user = current_user
    end
  end

  def edit_bank_info
    @title = "Edit Bank Account Info"
    if signed_in?
      @user = current_user
    end
  end

end
