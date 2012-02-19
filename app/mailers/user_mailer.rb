class UserMailer < ActionMailer::Base
  default from: "ralph@irvanaventures.com"

  def registration_email(user)
  	@user = user
  	mail(:to => user.email, :subject => "Welcome to Noatta!")
  end

end
