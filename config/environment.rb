# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Blocipedia::Application.initialize!

# Configuration for using SendGrid on Heroku
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :user_name => "app45264104@heroku.com",
  :password => "s9ouhqjp1934",
  :domain => "localhost",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
