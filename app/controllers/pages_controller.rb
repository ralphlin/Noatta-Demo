class PagesController < ApplicationController
  def home
    if signed_in?
      @user = current_user
    end
    @title = "Noatta Demo"
    @noheader = true;
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
    if signed_in?
      @user = current_user
    end
  end

  def clientdemo
    @title = "Client Demo"
    @noheader = true;
  end

  def serverdemo
    @title = "Server Demo"
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
      @user = current_user
    end
    @noheader=true   
  end

  def checkin
    @title = "Check In"
    @foundID
    @noheader = true;
  end

  def usernotfound
    @title = "User Not Found!"
    @noheader = true;
  end

  def scansuccess
    @user = User.find(params[:id])
    @title = @user.name
    @noheader = true;
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

  def bank_accounts
    if signed_in?
      @user = current_user
    end
    @title = "Payment Accounts"
  end

  def merchants
    @title = "Businesses/Merchants"
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
  
  def paymentscan
    @title = "Payment Scan"
    @noheader = true;
  end

  def enterpayment
    @title = "Payment"
    @noheader = true;
  end

  def paymentconfirmation
    @user = User.find(params[:id])
    @title = @user.name
    @noheader = true;
  end

  def paymentposted
    @user = User.find(params[:id])
    @title = @user.name
    @transaction = Transaction.new
    @noheader = true;
  end

  def profile
    @title = "Profile"
    if signed_in?
      @user = current_user
    end
  end

end
