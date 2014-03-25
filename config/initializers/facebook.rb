APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

if Rails.env.development?
	env_config = YAML.load_file(APP_ROOT.join( 'facebook.yml'))

	env_config.each do |key,value|
	  ENV[key] = value
	end
end