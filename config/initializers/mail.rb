ActionMailer::Base.smtp_settings = {
	address: "smtp.sendgrid.net",
	port: 587,
	enable_starttls_auto: true,
	user_name: ENV["SENDGRID_USERNAME"],
	password: ENV["SENDGRID_PASSWORD"],
	authentication: :plain,
	:domain => 'www.emerge.art.br'
}

ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.default charset: "utf-8"