config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'example.com',
  user_name:            'betterbetapp@gmail.com',
  password:             'devbootcamp',
  authentication:       'plain',
  enable_starttls_auto: true  }