if Rails.development?
	env_config = YAML.load_file(APP_ROOT.join( 'stripe.yml'))

	env_config.each do |key,value|
	  ENV[key] = value
	end
end

Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]