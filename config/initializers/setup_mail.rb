if Rails.env.development?
	email_settings = YAML::load(File.open("#{Rails.root.to_s}/config/email.yml"))[Rails.env]
elsif Rails.env.production?
 email_settings = YAML::load(ENV["EMAIL_SETUP"])
end
ActionMailer::Base.smtp_settings = email_settings