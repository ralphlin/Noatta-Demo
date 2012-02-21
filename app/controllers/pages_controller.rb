class PagesController < ApplicationController
  def home
  	@title = "Home"
  end

  def mbtest
    @mb_online_add_arrival = MbOnlineAddArrival.new(params[:mb_online_add_arrival]) if params[:mb_online_add_arrival].present?
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
  
  def scansuccess
    @user = User.find(params[:id])
    @title = @user.name
  end

  def scanin
    if (params[:id] == "000000000")
      flash[:failure]="User not in Noatta database!"
      redirect_to clientdemo_path
    else
      @user = User.find(params[:id])
      @title = @user.name
      @mb_online_add_arrival = MbOnlineAddArrival.new(@user.business1_id) if @user.present?
      if @mb_online_add_arrival.status == "Success"
        redirect_to "/scansuccess/" + params[:id].to_s
      else
        flash[:failure]= "User not found in Mind Body database!"
        redirect_to clientdemo_path
      end
    end
  end

  def scanpay
    @user = User.find(params[:id])
    @title = @user.name
  end

end
