# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Bidder::Application.initialize!

Paperclip.options[:command_path] = "C:/Program Files/ImageMagick-6.8.8-Q16"