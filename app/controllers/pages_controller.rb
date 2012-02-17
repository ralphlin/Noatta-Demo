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
    @transaction = Transaction.new
  end

  def payment_scan
    @title = "Payment Scan"
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

  def edit_merchant_info
    @title = "Edit Merchant Info"
    if signed_in?
      @user = current_user
    end
  end
  
  def scanin
    @user = User.find(params[:id])
    @title = @user.name
  end

  def scanpay
    @user = User.find(params[:id])
    @title = @user.name
  end

end
