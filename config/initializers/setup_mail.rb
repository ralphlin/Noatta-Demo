ActionMailer::Base.smtp_settings = {
	:address			=> "smtp.gmail.com",
	:port				=> 587,
	:domain				=> "gmail.com",
	:user_name			=> "noattauser@gmail.com",
	:password			=> "irvanaventures",
	:authentication		=> "plain",
	:enable_starttls_auto => true
}