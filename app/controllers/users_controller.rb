class UsersController < ApplicationController
  # commented out for unsecure finger scan in without password
  # before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end

  def show
  	@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
  	@transactions = @user.transactions.paginate(:page => params[:page])
    @title = @user.name
  end

  def new
    if signed_in?
      redirect_to root_path
    else
      @user = User.new
      @title = "Sign Up"
    end
  end

  def create
    if signed_in?
      redirect_to root_path
    else
      @user = User.new(params[:user])
  	  if @user.save
        UserMailer.registration_email(@user).deliver
        sign_in @user
  		  flash[:success] = "New User Created!"
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
    # @user = User.find(params[:id]) test comment
    if @user.update_attributes(params[:user])
      flash[:succes] = "Profile updated."
      redirect_to @user
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
