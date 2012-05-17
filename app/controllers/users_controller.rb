class UsersController < ApplicationController
  # commented out for unsecure finger scan in without password
  # before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
    if signed_in?
      @user = current_user
    end
  end

  def show
  	@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
  	@transactions = @user.transactions.paginate(:page => params[:page], :per_page => 5)
    @title = "Transactions"
  end

  def new
    if signed_in?
      redirect_to root_path
    else
      @user = User.new
      @title = "Sign Up"
    end
  end

  def newscanuser
    if signed_in?
      redirect_to root_path
    else
      @user = User.new
      @title = "Sign Up"
    end
    @noheader = true
  end

  def createandregisterscan
    @nosidebar = true
    @nonav = true
    if signed_in?
      redirect_to root_path
    else
      params[:user][:password]= ('a'..'z').to_a.shuffle[0..7].join
      params[:user][:confirm_password] = params[:user][:password]
      @user = User.new(params[:user])
      if @user.save
        UserMailer.registration_email(@user).deliver
      else
        @title = "Sign Up"
        render 'new'
      end
    end
  end

  def newscanuserregistered
    @title = "Welcome!"
    @nosidebar = true
    @nonav = true
  end

  def newusersetup
    @title = "Welcome to Noatta!"
    @user = current_user
    @nosidebar = true
  end

  def newusersetup_personalinfo
    @title = "Setting up account information"
    @user = current_user
    @nosidebar = true
  end

  def save_personalinfo
    @user = current_user
    @nosidebar = true
    if @user.update_attributes(params[:user])
      sign_in @user
      redirect_to newusersetup_bankinfo_path
    else
      flash[:failure] = "Unable to save personal info!"
      redirect_to root_path
    end
  end

  def newusersetup_bankinfo
    @title = "Setting up banks"
    @user = current_user
    @nosidebar = true
  end

  def save_bankinfo
    @user = current_user
    @nosidebar = true
    if @user.update_attributes(params[:user])
      sign_in @user
      redirect_to newusersetup_merchantinfo_path
    else
      flash[:failure] = "Unable to save bank info!"
      redirect_to root_path
    end
  end

  def newusersetup_merchantinfo
    @title = "Setting up merchants"
    @user = current_user
    @user.business1_name = "Mobius Fit"
    @user.business2_name = "Stanford University"
    @user.business3_name = "Costco"
    @user.business4_name = "Starbucks"
    @nosidebar = true
  end

  def save_merchantinfo
    @user = current_user
    @user.business1_name = "Mobius Fit"
    @user.business2_name = "Stanford University"
    @user.business3_name = "Costco"
    @user.business4_name = "Starbucks"
    @nosidebar = true
    if @user.update_attributes(params[:user])
      sign_in @user
      redirect_to newusersetup_finished_path
    else
      flash[:failure] = "Unable to save merchant info!"
      redirect_to root_path
    end
  end

  def newusersetup_finished
    @title = "Registration complete"
    @user = current_user
    @nosidebar = true
    @nonav = true
  end

  def create
    if signed_in?
      redirect_to root_path
    else
      @user = User.new(params[:user])
  	  if @user.save
        sign_in @user
  		  flash[:success] = "New user account created!"
  		  redirect_to @user
  	  else
  		  @title = "Sign Up"
  		  render 'new'
  	  end
    end
  end

  def edit
    @title = "Edit user"
  end

  def confirm_password
    @title = "Confirm Password"
  end

  def update_bank_info
    # @user = User.find(params[:id]) test comment
    if @user.update_attributes(params[:user])
      flash[:succes] = "Bank Info updated."
      redirect_to bank_accounts_path
    else
      @title = "Confirm password"
      render 'confirm_password'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:succes] = "Profile updated."
      redirect_to profile_path
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy
    if User.find(params[:id]).admin?
      flash[:success] = "You cannot delete administrator accounts!"
      redirect_to users_path
    else
      User.find(params[:id]).destroy
      flash[:success] = "User destroyed."
      redirect_to users_path
    end
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end




end
