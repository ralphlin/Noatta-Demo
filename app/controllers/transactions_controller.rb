class TransactionsController < ApplicationController
  
  def create
  	@transaction = current_user.transactions.build(params[:transaction])
  	if @transaction.save
  		redirect_to root_path
  	else
  		render 'pages/home'
  	end
  end

  def destroy
    @transaction.destroy
    redirect_back_or root_path
  end

end
