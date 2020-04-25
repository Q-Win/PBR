ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require 'simplecov'
SimpleCov.start 'rails' do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/test/' # for minitest
  add_filter "app/channels"
  add_filter "app/jobs"
  add_filter "app/mailer"
end


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def sign_in_as(user, password)
    post login_path, params: {session: {email: user.email, password: password}}
  end

end
